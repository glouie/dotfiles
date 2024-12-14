return {
    {
        'MunifTanjim/nui.nvim',
        'VonHeikemen/fine-cmdline.nvim',
        config = function()
            local fineline = require 'fine-cmdline'
            local fn = fineline.fn
            fineline.setup {
                cmdline = {
                    enable_keymaps = true,
                    smart_history = true,
                    prompt = '',
                },
                popup = {
                    position = {
                        row = '10%',
                        col = '50%',
                    },
                    size = {
                        width = '60%',
                    },
                    border = {
                        style = 'rounded',
                    },
                    win_options = {
                        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
                    },
                },
                hooks = {
                    before_mount = function(input)
                        -- code
                    end,
                    after_mount = function(input)
                        -- code
                    end,
                    set_keymaps = function(imap, feedkeys)
                        -- Restore default keybindings...
                        -- Except ufor `<Tab>`, that's what everyone uses to autocomplete
                        imap('<Esc>', fn.close)
                        imap('<C-c>', fn.close)

                        imap('<Up>', fn.up_search_history)
                        imap('<Down>', fn.down_search_history)
                    end,
                },
            }
            vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
        end,
    },
}
