-- None-ls
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.

return {
    'nvimtools/none-ls.nvim',

    config = function()
        local null_ls = require 'null-ls'
        -- local none_ls_extras = require 'none-ls-extras.nvim'

        null_ls.setup {
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.diagnostics.eslint_d,
                -- require 'none-ls.diagnostics.eslint',
            },
        }

        vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { desc = 'Auto Format' })
    end,
}
