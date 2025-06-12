return {
  {
    -- # make directory and save file.
    vim.api.nvim_create_user_command('WriteWithPath', '!mkdir -p "%:h" | w', {}),

    -- # save and run file with python
    vim.api.nvim_create_user_command('WriteAndExecutePython3', 'w | !python3 "%:p"', {
      desc = 'Save file and execute with python3.',
    }),

    -- open yazi if nvim opens in a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local argv = vim.fn.argv()
        if #argv == 1 and vim.fn.isdirectory(argv[1]) == 1 then
          vim.cmd(":Yazi cwd")
          -- vim.fn.jobstart({ "yazi", argv[1] }, { detach = true })
        end
      end
    }),
  },
}
