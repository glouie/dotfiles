-- alpha-nvim plugin
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local ok, alpha = pcall(require, 'alpha')
      if not ok then
        vim.notify('alpha.nvim not found', vim.log.levels.ERROR)
        return
      end
      local startify = require 'alpha.themes.startify'
      alpha.setup(startify.config)
    end,
  },
}
