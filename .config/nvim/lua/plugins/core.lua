return {
    {
        'preservim/nerdtree',
        config = function()
            -- toggle tree by Ctrl-e
            vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
            -- show hidden files
            vim.g.NERDTreeShowHidden = 1
        end
    },
    {
        'Xuyuanp/nerdtree-git-plugin',
        dependencies = { 'preservim/nerdtree' }
    },
    { 'ryanoasis/vim-devicons' },
    { 'ConradIrwin/vim-bracketed-paste' },
    { 'yuttie/comfortable-motion.vim' },
    {
        'itchyny/lightline.vim',
        config = function()
            -- Lightlineのカスタムfilename関数
            vim.g.lightline = {
                component_function = {
                    filename = "LightlineFilename",
                },
            }
            vim.cmd([[
              function! LightlineFilename()
                return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
                      \ &filetype ==# 'unite' ? unite#get_status_string() :
                      \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
                      \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
              endfunction
            ]])
            vim.g.vimfiler_force_overwrite_statusline = 0
            vim.g.vimshell_force_overwrite_statusline = 0
        end,
    },
    {
        "APZelos/blamer.nvim",
        config = function()
          vim.g.blamer_enabled = 1
          vim.g.blamer_delay = 500
          vim.g.blamer_date_format = "%Y-%m-%d %H:%M:%S"
        end,
    },
    {
        "preservim/tagbar",
        config = function()
            vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })
        end,
    },
}
