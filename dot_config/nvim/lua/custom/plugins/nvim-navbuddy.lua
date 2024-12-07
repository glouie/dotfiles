return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'SmiteshP/nvim-navbuddy',
      dependencies = {
        'SmiteshP/nvim-navic',
        'MunifTanjim/nui.nvim',
      },
      opts = { lsp = { auto_attach = true } },
    },
  },
  -- your lsp config or other stuff
}
-- return {
--   'SmiteshP/nvim-navbuddy',
--   dependencies = {
--     'neovim/nvim-lspconfig',
--     'SmiteshP/nvim-navic',
--     'MunifTanjim/nui.nvim',
--   },
--   -- keys = {
--   --   { '<leader>nv', '<cmd>Navbuddy<cr>', desc = 'Nav' },
--     keys = require("mappings").navbuddy,
--   },
--   config = function()
--     local actions = require 'nvim-navbuddy.actions'
--     local navbuddy = require 'nvim-navbuddy'
--     navbuddy.setup {
--       window = {
--         border = 'double',
--       },
--       mappings = {
--         ['k'] = actions.next_sibling,
--         ['i'] = actions.previous_sibling,
--         ['j'] = actions.parent,
--         ['l'] = actions.children,
--       },
--       -- lsp = { auto_attach = true },
--       lsp = {
--         auto_attach = true,
--         preference = {
--           'lua_ls',
--           'cssls',
--           'html',
--           'pyright',
--           'tsserver',
--         },
--       },
--     }
--   end,
-- }
