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
map('n', '<leader>v', ':vsplit') -- space+v creates vertical split
map('n', '<leader>s', ':split')  -- space+s creates horizontal split

-- -- easy split navigation
-- map('n', '<C-h>', '<C-w>h')       -- ctrl+h switches to left window
-- map('n', '<C-j>', '<C-w>j')       -- ctrl+j switches to bottom window
-- map('n', '<C-k>', '<C-w>k')       -- ctrl+k switches to top window
-- map('n', '<C-l>', '<C-w>l')       -- ctrl+l switches to right window

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

map('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
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
map('n', '<leader>pt', '<cmd>Telescope terms<CR>', { desc = 'telescope pick hidden term' })
map('n', '<leader>th', '<cmd>Telescope themes<CR>', { desc = 'telescope nvchad themes' })
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'telescope find files' })
map('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
  { desc = 'telescope find all files' })

-- terminal
map('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- new terminals
map('n', '<leader>h', function()
  require('nvchad.term').new { pos = 'sp' }
end, { desc = 'terminal new horizontal term' })

map('n', '<leader>v', function()
  require('nvchad.term').new { pos = 'vsp' }
end, { desc = 'terminal new vertical window' })

-- toggleable
map({ 'n', 't' }, '<A-v>', function()
  require('nvchad.term').toggle { pos = 'vsp', id = 'vtoggleTerm' }
end, { desc = 'terminal toggleable vertical term' })

map({ 'n', 't' }, '<A-h>', function()
  require('nvchad.term').toggle { pos = 'sp', id = 'htoggleTerm' }
end, { desc = 'terminal new horizontal term' })

map({ 'n', 't' }, '<A-i>', function()
  require('nvchad.term').toggle { pos = 'float', id = 'floatTerm' }
end, { desc = 'terminal toggle floating term' })

-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<leader>wk', function()
  vim.cmd('WhichKey ' .. vim.fn.input 'WhichKey: ')
end, { desc = 'whichkey query lookup' })

-- Visual Maps
map('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- find and replace
map('v', '<C-s>', ':sort<CR>')                        -- sort highlighted lines
map('v', 'J', ":m '>+1<CR>gv=gv")                     -- move current line up
map('v', 'K', ":m '>-2<CR>gv=gv")                     -- move current line down

-- navigation
map('n', 'B', '^', { noremap = false })
map('n', 'E', '$', { noremap = false })

return {}
