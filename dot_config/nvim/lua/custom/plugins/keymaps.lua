-- [[ Basic Keymaps ]]
local map = vim.keymap.set
-- key remaps
vim.g.mapleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', '<leader>pv', '<cmd>:Vex<CR>') -- Opens netrw (file explorer)
map('n', '<leader><CR>', '<cmd>:so ~/.config/nvim/init.lua<CR>')

map('n', '<C-p>', '<cmd>:FZF<CR>')

-- easy split generation
map('n', '<leader>|', ':vsplit<CR>') -- space+| creates vertical split
map('n', '<leader>-', ':split<CR>')  -- space+- creates horizontal split

-- -- easy split navigation
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<Tab>', ':bnext <CR>')                -- goes to next buffer(file)
map('n', '<S-Tab>', ':bprevious <CR>')          -- goes to previous buffer
map('n', '<leader>d', ':bd! <CR>')              -- delete the current buffer

map('n', '<C-Left>', ':vertical resize +3<CR>') -- resize vertical by 3
map('n', '<C-Right>', ':vertical resize -3<CR>')

map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- quick ESC
map('i', 'kj', '<ESC>')
map('i', 'jk', '<ESC>')

-- moving in insert mode.
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map('n', '<C-s>', '<Esc><cmd>w<CR>', { desc = 'file save' })
map('i', '<C-s>', '<Esc><cmd>w<CR>', { desc = 'file save' })
map('n', '<C-c>f', '<cmd>%y+<CR>', { desc = 'file copy whole' })

-- global lsp mappings
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'lsp diagnostic loclist' })

-- Comment
map('n', '<leader>/', 'gcc', { desc = 'comment toggle', remap = true })
map('v', '<leader>/', 'gc', { desc = 'comment toggle', remap = true })

-- telescope
map('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'telescope live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'telescope find buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'telescope help page' })
map('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'telescope find oldfiles' })
map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
map('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
map('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'telescope find files' })
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
  { desc = 'telescope find all files' })

-- terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

-- Visual Maps
map('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- find and replace
map('v', '<C-s>', ':sort<CR>')                        -- sort highlighted lines
map('v', 'J', ":m '>+1<CR>gv=gv")                     -- move current line up
map('v', 'K', ":m '>-2<CR>gv=gv")                     -- move current line down

-- navigation
map('n', 'B', '^', { noremap = false })
map('n', 'E', '$', { noremap = false })

return {}
