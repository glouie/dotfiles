return {
  {
    'rlane/pounce.nvim',
    -- enabled = false,
    config = function()
      require('pounce').setup {
        accept_keys = 'NTESIROAGJKDFVBYMCXWPQZ',
        accept_best_key = '<enter>',
        multi_window = true,
        debug = false,
      }
    end,
  },
}
