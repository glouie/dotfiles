-- nvim-dap

return {
    {
        'mfussenegger/nvim-dap',
        enabled = false,
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'leoluz/nvim-dap-go',
            'nvim-neotest/nvim-nio',
        },
        config = function()
            local dap = require 'dap'
            local dapui = require 'dapui'
            local dapgo = require 'dap-go'

            dapui.setup {
                -- Set icons to characters that are more likely to work in every terminal.
                --    Feel free to remove or use ones that you like more! :)
                --    Don't feel like these are good choices.
                icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
                controls = {
                    icons = {
                        pause = '⏸',
                        play = '▶',
                        step_into = '⏎',
                        step_over = '⏭',
                        step_out = '⏮',
                        step_back = 'b',
                        run_last = '▶▶',
                        terminate = '⏹',
                        disconnect = '⏏',
                    },
                },
            }
            dapgo.setup {
                -- Additional dap configurations can be added.
                -- dap_configurations accepts a list of tables where each entry
                -- represents a dap configuration. For more details do:
                -- :help dap-configuration
                dap_configurations = {
                    {
                        -- Must be "go" or it will be ignored by the plugin
                        type = 'go',
                        name = 'Attach remote',
                        mode = 'remote',
                        request = 'attach',
                    },
                },
                -- delve configurations
                delve = {
                    -- the path to the executable dlv which will be used for debugging.
                    -- by default, this is the "dlv" executable on your PATH.
                    path = 'dlv',
                    -- time to wait for delve to initialize the debug session.
                    -- default to 20 seconds
                    initialize_timeout_sec = 20,
                    -- a string that defines the port to start delve debugger.
                    -- default to string "${port}" which instructs nvim-dap
                    -- to start the process in a random available port
                    port = '${port}',
                    -- additional args to pass to dlv
                    args = {},
                    -- the build flags that are passed to delve.
                    -- defaults to empty string, but can be used to provide flags
                    -- such as "-tags=unit" to make sure the test suite is
                    -- compiled during debugging, for example.
                    -- passing build flags using args is ineffective, as those are
                    -- ignored by delve in dap mode.
                    build_flags = '',
                },
            }

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set('n', '<F5>', function()
                dap.continue()
            end)
            vim.keymap.set('n', '<F10>', function()
                dap.step_over()
            end)
            vim.keymap.set('n', '<F11>', function()
                dap.step_into()
            end)
            vim.keymap.set('n', '<F12>', function()
                dap.step_out()
            end)
            vim.keymap.set('n', '<Leader>b', function()
                dap.toggle_breakpoint()
            end)

            dap.adapters['local-lua'] = {
                type = 'executable',
                command = 'node',
                args = {
                    '/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js',
                },
                enrich_config = function(config, on_config)
                    if not config['extensionPath'] then
                        local c = vim.deepcopy(config)
                        -- 💀 If this is missing or wrong you'll see
                        -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
                        c.extensionPath = '/absolute/path/to/local-lua-debugger-vscode/'
                        on_config(c)
                    else
                        on_config(config)
                    end
                end,
            }

            dap.adapters.go = {
                type = 'executable',
                command = 'node',
                args = { os.getenv 'HOME' .. '/dev/golang/vscode-go/dist/debugAdapter.js' },
            }
            dap.configurations.go = {
                {
                    type = 'go',
                    name = 'Debug',
                    request = 'launch',
                    showLog = false,
                    program = '${file}',
                    dlvToolPath = vim.fn.exepath 'dlv', -- Adjust to where delve is installed
                },
            }
        end,
    },
}
