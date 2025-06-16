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
vim.keymap.set('n', '<leader>ls', '<cmd>:so ~/.config/nvim/init.lua<CR>', { desc = '[S]ource nvim init file.' })
vim.keymap.set('n', '<leader>lf', '<cmd>source %<CR>', { desc = 'Source current [f]ile.' })
vim.keymap.set('n', '<leader>le', ':.lua<CR>', { desc = '[E]xecute lua line.' })
vim.keymap.set('v', '<leader>le', ':lua<CR>', { desc = '[E]xecute highlighted lua lines.' })
vim.keymap.set({ 'n', 'v' }, '<space>lr', ':!lua %<CR>', { silent = true, desc = '[R]un lua on entire file.' })

-- python keymaps
vim.keymap.set('n', '<leader>pr', ':!python3 %<CR>', { desc = '[R]un python3 on this file.' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- fzf
vim.keymap.set('n', '<C-p>', '<cmd>:FZF<CR>', { desc = 'Open FZF file finder' })

-- easy split generation
vim.keymap.set('n', '<leader>|', ':vsplit<CR>', { desc = 'Create vertical split' })
vim.keymap.set('n', '<leader>-', ':split<CR>', { desc = 'Create horizontal split' })

-- -- easy split navigation
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- buffer navigation
vim.keymap.set('n', '<C-Tab>', ':bnext <CR>', { desc = 'Goes to next buffer(file)' })
vim.keymap.set('n', '<C-S-Tab>', ':bprevious <CR>', { desc = 'Goes to previous buffer(file)' })
vim.keymap.set('n', '<leader>x', ':bd <CR>', { desc = 'Closes current buffer without saving' })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { desc = 'Creates a new buffer' })
--

-- pane split navigation
vim.keymap.set('n', '<leader>tK', '<C-w>t<C-w>K', { desc = 'Make pane split vertically' })
vim.keymap.set('n', '<leader>tH', '<C-w>t<C-w>H', { desc = 'Make pane split horizontally' })

-- vertical scrop and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Find and center, to be used with the find command
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
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = '[O]pen new tab', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[C]lose tab', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = '[N]ext tab', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = '[P]revious tab', noremap = true, silent = true })

-- toggle line wrapping
vim.keymap.set('n', '<leader>lm', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap', noremap = true, silent = true })

-- Stay in indent mode while resizing
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Key last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- navigation
vim.keymap.set('n', 'B', '^', { noremap = false })
vim.keymap.set('n', 'E', '$', { noremap = false })

-- moving in insert mode.
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Move beginning of line' })
vim.keymap.set('i', '<C-e>', '<End>', { desc = 'Move end of line' })
vim.keymap.set('i', '<C-h>', '<Left>', { desc = 'Move left' })
vim.keymap.set('i', '<C-l>', '<Right>', { desc = 'Move right' })
vim.keymap.set('i', '<C-j>', '<Down>', { desc = 'Move down' })
vim.keymap.set('i', '<C-k>', '<Up>', { desc = 'Move up' })

vim.keymap.set('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>sn', '<Esc><cmd>noautocmd w<CR>', { desc = 'Esc and save' })
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<C-c>f', '<cmd>%y+<CR>', { desc = 'Copy whole file' })

-- global lsp mappings
-- vim.keymap.set('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'lsp diagnostic loclist' })

-- Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Comment
vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Comment toggle', remap = true })
vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Comment toggle', remap = true })

-- telescope
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope live [g]rep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Telescope find [b]uffers' })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'Telescope [h]elp page' })
vim.keymap.set('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'Telescope find [m]arks' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'Telescope find [o]ldfiles' })
vim.keymap.set('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>',
  { desc = 'Telescope find in current buffer[z]' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<CR>', { desc = 'Telescope git [c]ommits' })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope git_status<CR>', { desc = 'Telescope git [s]tatus' })
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope find [f]iles' })
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
  { desc = 'Telescope find [a]ll files' })

-- terminal
-- <C-/> is mapped to opening the terminal, in a the snacks-nvim.lua file.
vim.keymap.set('t', '<C-x>', '<C-\\><C-N>', { desc = 'Terminal: escape terminal mode' })

-- whichkey
vim.keymap.set('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'Whichkey all keymaps' })

-- Visual Maps
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>', { desc = 'Find and replace' })
vim.keymap.set('v', '<C-s>', ':sort<CR>', { desc = 'Sort highlighted lines' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move current line up' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move current line down' })

-- vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- pounce
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':Pounce<CR>', { silent = true, desc = 'Pounce' })
vim.keymap.set('n', 'H', ':PounceRepeat<CR>', { silent = true, desc = 'Pounce Repeat' })

-- format
-- defined in the lsp.lua file
vim.keymap.set('n', '<leader>=', function()
  vim.lsp.buf.format()
end, { silent = true, desc = 'Format buffer' })

-- neogen
vim.api.nvim_set_keymap('n', '<leader>nf', ":lua require('neogen').generate()<CR>",
  { desc = 'Generate documentation.', noremap = true, silent = true })

-- zen-mode
vim.keymap.set('n', '<leader><cr>', '<cmd>ZenMode<CR>', { desc = 'Toggle Zen Mode' })

-- try and fix the esc issue not leaving insert mode
vim.keymap.set('i', '<esc>', '<ESC>', { desc = 'Escape is escape' })
return {}
