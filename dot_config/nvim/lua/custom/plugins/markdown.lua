-- install without yarn or npm
return {
    {
        {
            'iamcco/markdown-preview.nvim',
            cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
            ft = { 'markdown' },
            build = function()
                vim.fn['mkdp#util#install']()
            end,
        },
        {
            'MeanderingProgrammer/markdown.nvim',
            main = 'render-markdown',
            opt = {},
            name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons',
            },
            config = function()
                local rm = require 'render-markdown'

                rm.setup()
                vim.keymap.set('n', '<leader>h', function()
                    rm.contract()
                end)
                vim.keymap.set('n', '<leader>e', function()
                    rm.expand()
                end)
            end,
        },
    },
}
