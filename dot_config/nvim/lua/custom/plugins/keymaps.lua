-- [[ Basic Keymaps ]]
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- key remaps
vim.g.mapleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- Disables the spacebar key from default behavior in Normal and Visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- lua keymaps
vim.keymap.set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Source current file.' })
vim.keymap.set('n', '<leader>e', ':.lua<CR>', { desc = 'Execute lua line.' })
vim.keymap.set('n', '<leader>e', ':lua<CR>', { desc = 'Execute highlighted lua lines.' })

-- python keymaps
vim.keymap.set('n', '<leader>py', ':!python3 %<CR>', { desc = 'Run python3 on this file.' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>pv', '<cmd>:Vex<CR>') -- Opens netrw (file explorer)
vim.keymap.set('n', '<leader><CR>', '<cmd>:so ~/.config/nvim/init.lua<CR>')

vim.keymap.set('n', '<C-p>', '<cmd>:FZF<CR>')

-- easy split generation
vim.keymap.set('n', '<leader>|', ':vsplit<CR>') -- space+| creates vertical split
vim.keymap.set('n', '<leader>-', ':split<CR>') -- space+- creates horizontal split

-- -- easy split navigation
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
vim.keymap.set('n', '<leader>x', ':bd! <CR>') -- delete the current buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>') -- new buffer
--
-- vim.keymap.set('n', '<C-S-Left>', ':vertical resize +3<CR>') -- resize vertical by 3
-- vim.keymap.set('n', '<C-S-Right>', ':vertical resize -3<CR>')
--
-- -- vertical scrop and center
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- quick ESC
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabcloase<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

-- toggle line wrapping
vim.keymap.set('n', '<leader>lm', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode while resizing
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keey last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- moving in insert mode.
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'move end of line' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'move up' })

vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
vim.keymap.set('n', '<leader>sn', '<Esc><cmd>noautocmd w<CR>', { desc = 'quit save' })
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'quit save' })
vim.keymap.set('n', '<C-c>f', '<cmd>%y+<CR>', { desc = 'file copy whole' })

-- global lsp mappings
-- vim.keymap.set('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'lsp diagnostic loclist' })

-- Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Comment
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'comment toggle', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'comment toggle', remap = true })

-- telescope
vim.keymap.set('n', '<leader>fw', '<cmd>Telescope live_grep<CR>', { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'telescope find buffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'telescope help page' })
vim.keymap.set('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'telescope find oldfiles' })
vim.keymap.set('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'telescope find in current buffer' })
vim.keymap.set('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
vim.keymap.set('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'telescope find files' })
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', { desc = 'telescope find all files' })

-- terminal
vim.keymap.set('t', '<C-x>', '<C-\\><C-N>', { desc = 'terminal escape terminal mode' })

-- whichkey
vim.keymap.set('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

-- Visual Maps
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- find and replace
vim.keymap.set('v', '<C-s>', ':sort<CR>') -- sort highlighted lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- move current line up
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv") -- move current line down

-- navigation
vim.keymap.set('n', 'B', '^', { noremap = false })
vim.keymap.set('n', 'E', '$', { noremap = false })

vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- pounce
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':Pounce<CR>', { silent = true, desc = 'Pounce' })
vim.keymap.set('n', 'H', ':PounceRepeat<CR>', { silent = true, desc = 'Pounce Repeat' })

-- format
-- defined in the lsp.lua file
-- vim.keymap.set('n', '<leader>=', function()
--     vim.lsp.buf.format()
-- end)

-- lua
vim.keymap.set('n', '<space>e', ':.lua<CR>', { silent = true, desc = 'Run lua on the highlighted lines.' })
vim.keymap.set('v', '<space>e', ':lua<CR>', { silent = true, desc = 'Run lua on the highlighted lines.' })
vim.keymap.set({ 'n', 'v' }, '<space>r', ':!lua %<CR>', { silent = true, desc = 'Run lua on entire file.' })

-- neogen
vim.api.nvim_set_keymap('n', '<leader>nf', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
return {}
