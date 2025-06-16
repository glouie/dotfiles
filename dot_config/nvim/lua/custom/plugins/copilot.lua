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
          auto_trigger = true, -- Enable auto-triggering suggestions
          keymap = {
            -- accept = '<C-S-A>',      -- Custom keymap for accepting suggestions
            accept = '<A-Tab>',    -- Custom keymap for accepting suggestions
            accept_word = '<A-w>', -- Custom keymap for accepting suggestions
            accept_line = '<A-l>', -- Custom keymap for accepting suggestions
            next = '<C-]>',        -- Custom keymap for cycling to the next suggestions
            prev = '<C-[>',        -- Custom keymap for cycling to the previous suggestions
            open = '<C-Space>',    -- Custom keymap for opening Copilot panel   :w
          },
          ignore_case = true,
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
          ['*'] = false, -- disable for all other filetypes and ignore default `filetypes`
        },
        -- Uses visual selection or falls back to buffer
        selection = function(source)
          local select = require 'copilot.utils.select'
          return select.visual(source) or select.buffer(source)
        end,
      }

      vim.keymap.set('i', '<Right>', function()
        require('copilot.suggestion').accept()
      end, { desc = 'Accept copilot suggestion' })

      vim.keymap.set('i', '<A-o>', function()
        require('copilot.suggestion').show()
      end, { desc = 'Copilot: Open Suggestions' })

      vim.keymap.set({ 'i', 'n', 'v' }, '<A-c>', ':CopilotChatToggle', { desc = 'Copilot: Toggle Chat Window' })
      vim.keymap.set({ 'i', 'n', 'v' }, '<A-x>', ':CopilotChatExplain', { desc = 'Copilot: Explain' })
      vim.keymap.set({ 'i', 'n', 'v' }, '<A-f>', ':CopilotChatFix', { desc = 'Copilot: Fix' })
      vim.keymap.set({ 'i', 'n', 'v' }, '<A-g>', ':CopilotChatCommit', { desc = 'Copilot: Commit' })
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
