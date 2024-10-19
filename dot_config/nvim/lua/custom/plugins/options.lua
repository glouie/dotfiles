-- options are automatically loaded before lazy.nvim startup
-- add any additional options here

-- [[ setting options ]]
-- see `:help vim.o`
-- note: you can change these options as you wish!

-- set highlight on search
vim.o.hlsearch = false

-- make line numbers default
vim.wo.number = true

-- enable mouse mode
vim.o.mouse = 'a'

-- sync clipboard between os and neovim.
--  remove this option if you want your os clipboard to remain independent.
--  see `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- enable break indent
vim.o.breakindent = true

-- save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'

-- case-insensitive searching unless \c or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- note: you should make sure your terminal supports this
vim.o.termguicolors = true

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
-- vim.o.fileencoding = 'utf-8'
vim.o.cmdheight = 1

-- popup menu height
vim.o.pumheight = 10

vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true

-- setting the theme
-- vim.cmd.colorscheme 'onedark'
-- vim.cmd.colorscheme 'catppuccin-frappe'
return {
  -- vim.cmd.colorscheme 'catppuccin-frappe'
}
