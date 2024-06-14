-- https://github.com/stevearc/conform.nvim

return {
  'stevearc/conform.nvim',
  opts = {},
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('conform').setup {
      formamtters_by_ft = {
        lua = { 'stylua' },
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black' },
        -- Use a sub-list to run only the first available formatter
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettier' } },
        typescriptreact = { { 'prettier' } },
        css = { { 'prettier' } },
        html = { { 'prettier' } },
        json = { { 'prettier' } },
        yaml = { { 'prettier' } },
        markdown = { { 'prettier' } },
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
      },
    }
  end,
}
