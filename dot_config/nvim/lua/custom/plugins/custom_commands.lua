return {
  {
    -- # make directory and save file.
    vim.api.nvim_create_user_command('WriteWithPath', '!mkdir -p "%:h" | w', {}),

    -- # save and run file with python
    vim.api.nvim_create_user_command('WriteAndExecutePython3', 'w | !python3 "%:p"', {
      desc = 'Save file and execute with python3.',
    }),
  },
}
