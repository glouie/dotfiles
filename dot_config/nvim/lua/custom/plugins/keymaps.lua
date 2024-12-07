-- [[ Basic Keymaps ]]
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- key remaps
vim.g.mapleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- Disables the spacebar key from default behavior in Normal and Visual mode
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- lua keymaps
map('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Source current file.' })
map('n', '<leader>e', ':.lua<CR>', { desc = 'Execute lua line.' })
map('n', '<leader>e', ':lua<CR>', { desc = 'Execute highlighted lua lines.' })

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

map('n', '<Tab>', ':bnext <CR>')         -- goes to next buffer(file)
map('n', '<S-Tab>', ':bprevious <CR>')   -- goes to previous buffer
map('n', '<leader>x', ':bd! <CR>')       -- delete the current buffer
map('n', '<leader>b', '<cmd> enew <CR>') -- new buffer
--
-- map('n', '<C-S-Left>', ':vertical resize +3<CR>') -- resize vertical by 3
-- map('n', '<C-S-Right>', ':vertical resize -3<CR>')
--
-- -- vertical scrop and center
-- map('n', '<C-d>', '<C-d>zz')
-- map('n', '<C-u>', '<C-u>zz')

-- Find and center
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
map('n', '<Up>', ':resize -2<CR>', opts)
map('n', '<Down>', ':resize +2<CR>', opts)
map('n', '<Left>', ':vertical resize -2<CR>', opts)
map('n', '<Right>', ':vertical resize +2<CR>', opts)

-- quick ESC
map('i', 'kj', '<ESC>')
map('i', 'jk', '<ESC>')

-- Tabs
map('n', '<leader>to', ':tabnew<CR>', opts)
map('n', '<leader>tx', ':tabcloase<CR>', opts)
map('n', '<leader>tn', ':tabn<CR>', opts)
map('n', '<leader>tp', ':tabp<CR>', opts)

-- toggle line wrapping
map('n', '<leader>lm', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode while resizing
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Keey last yanked when pasting
map('v', 'p', '"_dP', opts)

-- moving in insert mode.
map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
map('n', '<leader>sn', '<Esc><cmd>noautocmd w<CR>', { desc = 'quit save' })
map('n', '<C-q>', '<cmd>q<CR>', { desc = 'quit save' })
map('n', '<C-c>f', '<cmd>%y+<CR>', { desc = 'file copy whole' })

-- global lsp mappings
-- map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'lsp diagnostic loclist' })

-- Diagnostics keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

map('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- pounce
map({ 'n', 'v' }, '<leader>h', ':Pounce<CR>', { silent = true, desc = 'Pounce' })
map('n', 'H', ':PounceRepeat<CR>', { silent = true, desc = 'Pounce Repeat' })

return {}
