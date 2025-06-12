-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  opts = {},
  config = function(opts)
    require('which-key').setup(opts)

    -- which key directory, starting with <leader>
    require('which-key').register {
      ['<leader>f'] = { name = '[F]ind with telescope', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]ua', _ = 'which_key_ignore' },
      ['<leader>p'] = { name = '[P]ython', _ = 'which_key_ignore' },
    }
  end,
}
