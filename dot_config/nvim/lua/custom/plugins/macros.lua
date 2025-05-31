-------------------
-- Custom Macros --
-------------------

local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)

-- console log for .js, .ts files
vim.api.nvim_create_augroup('JSLogMacro', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogMacro',
  pattern = { 'javascript', 'typescript' },
  callback = function()
    vim.fn.setreg('l', "yoconsole.log('" .. esc .. "pa: '" .. esc .. '1a, ' .. esc .. 'pa);')
  end,
})

-- print() for .py files
vim.api.nvim_create_augroup('PyLogMacro', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'PyLogMacro',
  pattern = { 'python' },
  callback = function()
    vim.fn.setreg('l', "yoprint('" .. esc .. "pa: '" .. esc .. '1a, ' .. esc .. 'pa)')
  end,
})

return {}
