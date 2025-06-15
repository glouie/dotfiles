---@diagnostic disable: undefined-global
-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            opts = { lsp = { auto_attach = true } },
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            { 'folke/neodev.nvim' },
        },
        config = function()
            -- mason-lspconfig requires that these setup functions are called in this order
            -- before setting up the servers.
            require('mason').setup {
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            }

            require('mason-tool-installer').setup {
                ensure_installed = {
                    'prettier',
                    'prettierd',
                    'stylua',
                    'isort',
                    'black',
                    'pylint',
                    'rust-analyzer',
                },
            }

            require('mason-lspconfig').setup()
            -- Setup neovim lua configuration
            require('neodev').setup()

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- Ensure the servers above are installed
            local mason_lspconfig = require 'mason-lspconfig'
            mason_lspconfig.setup {
                automatic_enable = true,
                ensure_installed = {
                    'pylsp',
                    'rust_analyzer',
                    'lua_ls',
                },
            }

            -- Virtual text for errors
            vim.diagnostic.config {
                virtual_text = {
                    prefix = '●', -- Can be '●', '■', '▎', '➤', or just "" for no prefix
                    spacing = 2,
                },
                signs = true,             -- Show signs in the gutter
                underline = true,         -- Underline the error line
                update_in_insert = false, -- Avoid updating while typing
                severity_sort = true,     -- Show most severe issues first
            }

            local navbuddy = require 'nvim-navbuddy'
            local lspconfig = require 'lspconfig'

            lspconfig.html.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)
                end,
            }

            local capabilities = require('blink.cmp').get_lsp_capabilities()
            lspconfig.lua_ls.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)

                    vim.keymap.set('n', '<leader>=', function()
                        vim.lsp.buf.format()
                    end, { buffer = bufnr, desc = 'Format Document' })
                end,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    if client.supports_method and client:supports_method 'textDocument/formatting' then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            buffer = args.buf,
                            callback = function()
                                vim.lsp.buf.format { bufnr = args.buf, id = args.data.client_id }
                            end,
                        })
                    end
                end,
            })

            lspconfig.pyright.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)
                end,
            }
            lspconfig.pylsp.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)
                end,
            }
            lspconfig.rust_analyzer.setup {
                on_attach = function(client, bufnr)
                    navbuddy.attach(client, bufnr)
                end,
            }
        end,
    },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            local rt = require 'rust-tools'
            rt.setup {
                dap = {
                    adapter = {
                        type = 'executable',
                        command = 'lldb-vscode',
                        name = 'rt_lldb',
                    },
                },
                tools = {
                    autoSetHints = true,
                    hover_with_actions = true,

                    -- how to execute terminal commands
                    -- options right now: termopen / quickfix / toggleterm / vimux
                    executor = require('rust-tools.executors').termopen,

                    -- callback to execute once rust-analyzer is done initializing the workspace
                    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
                    on_initialized = nil,

                    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
                    reload_workspace_from_cargo_toml = true,

                    -- These apply to the default RustSetInlayHints command
                    inlay_hints = {
                        -- automatically set inlay hints (type hints)
                        -- default: true
                        auto = true,

                        -- Only show inlay hints for the current line
                        only_current_line = false,

                        -- whether to show parameter hints with the inlay hints or not
                        -- default: true
                        show_parameter_hints = true,

                        -- prefix for parameter hints
                        -- default: "<-"
                        parameter_hints_prefix = '<- ',

                        -- prefix for all the other hints (type, chaining)
                        -- default: "=>"
                        other_hints_prefix = '=> ',

                        -- whether to align to the length of the longest line in the file
                        max_len_align = false,

                        -- padding from the left if max_len_align is true
                        max_len_align_padding = 1,

                        -- whether to align to the extreme right or not
                        right_align = false,

                        -- padding from the right if right_align is true
                        right_align_padding = 7,

                        -- The color of the hints
                        highlight = 'Comment',
                    },

                    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                    hover_actions = {

                        -- the border that is used for the hover window
                        -- see vim.api.nvim_open_win()
                        border = {
                            { '╭', 'FloatBorder' },
                            { '─', 'FloatBorder' },
                            { '╮', 'FloatBorder' },
                            { '│', 'FloatBorder' },
                            { '╯', 'FloatBorder' },
                            { '─', 'FloatBorder' },
                            { '╰', 'FloatBorder' },
                            { '│', 'FloatBorder' },
                        },

                        -- Maximal width of the hover window. Nil means no max.
                        max_width = nil,

                        -- Maximal height of the hover window. Nil means no max.
                        max_height = nil,

                        -- whether the hover action window gets automatically focused
                        -- default: false
                        auto_focus = false,
                    },

                    -- settings for showing the crate graph based on graphviz and the dot
                    -- command
                    crate_graph = {
                        -- Backend used for displaying the graph
                        -- see: https://graphviz.org/docs/outputs/
                        -- default: x11
                        backend = 'x11',
                        -- where to store the output, nil for no output stored (relative
                        -- path from pwd)
                        -- default: nil
                        output = nil,
                        -- true for all crates.io and external crates, false only the local
                        -- crates
                        -- default: true
                        full = true,

                        -- List of backends found on: https://graphviz.org/docs/outputs/
                        -- Is used for input validation and autocompletion
                        -- Last updated: 2021-08-26
                        enabled_graphviz_backends = {
                            'bmp',
                            'cgimage',
                            'canon',
                            'dot',
                            'gv',
                            'xdot',
                            'xdot1.2',
                            'xdot1.4',
                            'eps',
                            'exr',
                            'fig',
                            'gd',
                            'gd2',
                            'gif',
                            'gtk',
                            'ico',
                            'cmap',
                            'ismap',
                            'imap',
                            'cmapx',
                            'imap_np',
                            'cmapx_np',
                            'jpg',
                            'jpeg',
                            'jpe',
                            'jp2',
                            'json',
                            'json0',
                            'dot_json',
                            'xdot_json',
                            'pdf',
                            'pic',
                            'pct',
                            'pict',
                            'plain',
                            'plain-ext',
                            'png',
                            'pov',
                            'ps',
                            'ps2',
                            'psd',
                            'sgi',
                            'svg',
                            'svgz',
                            'tga',
                            'tiff',
                            'tif',
                            'tk',
                            'vml',
                            'vmlz',
                            'wbmp',
                            'webp',
                            'xlib',
                            'x11',
                        },
                    },
                },
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            }
            rt.inlay_hints.enable()
            rt.hover_actions.hover_actions()
        end,
    },
}
