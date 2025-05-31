-- options are automatically loaded before lazy.nvim startup
-- add any additional options here
-- [[ setting options ]]
-- see `:help vim.o`
-- note: you can change these options as you wish!

-- set highlight on search
vim.opt.hlsearch = false

-- make line numbers default
vim.wo.number = true

-- enable mouse mode
vim.opt.mouse = 'a'

-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

-- case-insensitive searching unless \c or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- note: you should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.winbar = '%=%m %f'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.scrolloff = 4
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

-- conceallevel for obsidian.nvim
vim.opt.conceallevel = 2
vim.wo.signcolumn = 'yes'
-- vim.opt.fileencoding = 'utf-8'
vim.opt.cmdheight = 1

-- popup menu height
vim.opt.pumheight = 10

vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- set confirm to prompt if buffer is unsaved.
vim.opt.confirm = true

-- setting the theme
-- vim.cmd.colorscheme 'onedark'
-- vim.cmd.colorscheme 'catppuccin-frappe'
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

return {
  -- vim.cmd.colorscheme 'catppuccin-frappe'
}
