-- https://github.com/stevearc/conform.nvim

return {

  {
    'stevearc/conform.nvim',
    opts = {},
    -- event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local conform = require 'conform'

      conform.setup {
        formatters_by_ft = {
          lua = { 'stylua' },

          python = { 'isort', 'black' },
          -- Use a sub-list to run only the first available formatter
          javascript = { 'prettierd', 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          css = { 'prettier' },
          html = { 'prettier' },
          json = { 'prettier' },
          yaml = { 'prettier' },
          markdown = { 'prettier' },
        },

        vim.api.nvim_create_autocmd('BufWritePre', {
          pattern = '*',
          callback = function(args)
            require('conform').format { bufnr = args.buf }
          end,
        }),

        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>mp', function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end, { desc = 'Format file or range (in visual mode)' })
    end,
  },
}
