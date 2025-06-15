-- Copilot configuration for Neovim
-- This file sets up the Copilot plugin with custom keybindings and settings.
return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,       -- Enable auto-triggering suggestions
          keymap = {
            accept = '<C-S-A>',      -- Custom keymap for accepting suggestions
            accept_word = '<C-S-W>', -- Custom keymap for accepting suggestions
            accept_line = '<C-S-L>', -- Custom keymap for accepting suggestions
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
        },
        filetypes = {
          markdown = true,   -- Enable Copilot in Markdown files
          lua = true,
          javascript = true, -- allow specific filetype
          typescript = true, -- allow specific filetype
          python = true,
          bash = true,
          rust = true,
          ['*'] = true, -- disable for all other filetypes and ignore default `filetypes`
        },
      }

      vim.keymap.set('i', '<Right>', function()
        require('copilot.suggestion').accept()
      end, { desc = 'Accept copilot suggestion' })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      -- { 'github/copilot.vim' },                       -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken',                          -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
