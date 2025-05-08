return {
    {
        'previm/previm',
        config = function()
            vim.g.previm_enable_realtime = 1
            vim.g.previm_open_cmd = "open -a 'Google Chrome'"
        end,
    },
    {
        'tyru/open-browser.vim',
        lazy = true,
        dependencies = { 'previm/previm' },
    },
    {
        'plasticboy/vim-markdown',
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
        end,
    },
}
