-- return {
--     -- Adds git related signs to the gutter, as well as utilities for managing changes
--     'lewis6991/gitsigns.nvim',
--     opts = {
--         -- See `:help gitsigns.txt`
--         signs = {
--             add = { text = '+' },
--             change = { text = '~' },
--             delete = { text = '_' },
--             topdelete = { text = '‾' },
--             changedelete = { text = '~' },
--         },
--         on_attach = function(bufnr)
--             vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
--                 { buffer = bufnr, desc = 'Preview git hunk' })
--
--             -- don't override the built-in and fugitive keymaps
--             local gs = package.loaded.gitsigns
--             vim.keymap.set({ 'n', 'v' }, ']c', function()
--                 if vim.wo.diff then
--                     return ']c'
--                 end
--                 vim.schedule(function()
--                     gs.next_hunk()
--                 end)
--                 return '<Ignore>'
--             end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
--             vim.keymap.set({ 'n', 'v' }, '[c', function()
--                 if vim.wo.diff then
--                     return '[c'
--                 end
--                 vim.schedule(function()
--                     gs.prev_hunk()
--                 end)
--                 return '<Ignore>'
--             end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
--         end,
--     },
-- }

-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    {
      'lewis6991/gitsigns.nvim',
      enable = false,
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        signs_staged = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, { desc = 'Jump to next git [c]hange' })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = 'Jump to previous git [c]hange' })

          -- Actions
          -- visual mode
          map('v', '<leader>gs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'stage git hunk' })
          map('v', '<leader>gr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'reset git hunk' })
          -- normal mode
          map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
          map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
          map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
          map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
          map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
          map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
          map('n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })
          map('n', '<leader>gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
          map('n', '<leader>gD', function()
            gitsigns.diffthis '@'
          end, { desc = 'git [D]iff against last commit' })
          -- Toggles
          map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
          map('n', '<leader>gD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
        end,
      },
    },
  },
}
