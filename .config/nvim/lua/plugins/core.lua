return {
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup()
        vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
      end,
    },
    { 'ConradIrwin/vim-bracketed-paste' },
    { 'yuttie/comfortable-motion.vim' },
    {
        'itchyny/lightline.vim',
        config = function()
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
              endfunction ]]) vim.g.vimfiler_force_overwrite_statusline = 0
            vim.g.vimshell_force_overwrite_statusline = 0
        end,
    },
    {
        "APZelos/blamer.nvim",
        config = function()
          vim.g.blamer_enabled = false
          vim.g.blamer_delay = 400
          vim.g.blamer_date_format = "%Y-%m-%d %H:%M:%S"

          vim.keymap.set(
            "n",
            "<leader>gb",
            ":BlamerToggle<CR>", { noremap = true, silent = true })
        end,
    },
    {
        "preservim/tagbar",
        config = function()
            vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
          require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
              nvimtree = true,
            },
          })
          vim.cmd.colorscheme "catppuccin-nvim"
        end,
    },
}
