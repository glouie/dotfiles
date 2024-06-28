-- [[ Basic Keymaps ]]

-- key remaps
vim.g.mapleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>pv', '<cmd>:Vex<CR>') -- Opens netrw (file explorer)
vim.keymap.set('n', '<leader><CR>', '<cmd>:so ~/.config/nvim/init.lua<CR>')

vim.keymap.set('n', '<C-p>', '<cmd>:FZF<CR>')

-- easy split generation
vim.keymap.set('n', '<leader>v', ':vsplit') -- space+v creates vertical split
vim.keymap.set('n', '<leader>s', ':split') -- space+s creates horizontal split

-- -- easy split navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h')       -- ctrl+h switches to left window
-- vim.keymap.set('n', '<C-j>', '<C-w>j')       -- ctrl+j switches to bottom window
-- vim.keymap.set('n', '<C-k>', '<C-w>k')       -- ctrl+k switches to top window
-- vim.keymap.set('n', '<C-l>', '<C-w>l')       -- ctrl+l switches to right window

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<Tab>', ':bnext <CR>') -- goes to next buffer(file)
vim.keymap.set('n', '<S-Tab>', ':bprevious <CR>') -- goes to previous buffer
vim.keymap.set('n', '<leader>d', ':bd! <CR>') -- delete the current buffer

vim.keymap.set('n', '<C-Left>', ':vertical resize +3<CR>') -- resize vertical by 3
vim.keymap.set('n', '<C-Right>', ':vertical resize -3<CR>')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- quick ESC
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

-- Visual Maps
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- find and replace
vim.keymap.set('v', '<C-s>', ':sort<CR>') -- sort highlighted lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move current line up
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv") -- move current line down

-- navigation
vim.keymap.set('n', 'B', '^', { noremap = false })
vim.keymap.set('n', 'E', '$', { noremap = false })

return {}
