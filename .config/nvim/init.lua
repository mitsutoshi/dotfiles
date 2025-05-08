vim.g.python3_host_prog = os.getenv("PYENV_ROOT") .. "/versions/neovim-python3/bin/python"

vim.opt.backupdir = vim.fn.expand("~/.vim")
vim.opt.directory = vim.fn.expand("~/.vim")
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.list = true
vim.opt.listchars = { nbsp = "%", eol = "↲", tab = "»-", trail = "-", extends = "»", precedes = "«" }
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.encoding = "utf-8"
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.clipboard:append("unnamed")
vim.opt.startofline = false
vim.opt.compatible = false

-- color scheme
vim.cmd.colorscheme("jellybeans")

-- highlight space
vim.api.nvim_create_augroup("highlightIdeographicSpace", {})
vim.api.nvim_create_autocmd("Colorscheme", {
  group = "highlightIdeographicSpace",
  command = "highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen",
})
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter" }, {
  group = "highlightIdeographicSpace",
  command = [[match IdeographicSpace /　/]],
})

vim.g.mapleader = " "
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<C-p>", ":bprev<CR>", opts)
map("n", "<C-n>", ":bnext<CR>", opts)
map("n", "<C-x>p", ":echo expand('%')<CR>", opts)
map("n", "<C-x>fp", ":echo expand('%:p')<CR>", opts)
map("n", "t1", ":tabn1<CR>", opts)
map("n", "t2", ":tabn2<CR>", opts)
map("n", "t3", ":tabn3<CR>", opts)

-- lazy.nvim
vim.opt.rtp:prepend("~/.config/nvim/lazy/lazy.nvim")
require("lazy").setup("plugins")
