vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.gdefault = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel=99
vim.opt.showmatch = true
vim.opt.showbreak = "↪"
vim.opt.wrap = false
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.mouse = "a"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.laststatus = 3

vim.g.netrw_altfile = 1
vim.g.netrw_fastbrowse = 0
vim.g.netrw_liststyle = 0

vim.g.python3_host_prog = "$HOME/.pyenv/versions/tools/bin/python"

-- Wondering if I really need those
-- vim.opt.termguicolors = true
-- vim.opt.updatetime = 100
-- vim.opt.tags = "tags"
-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.swapfile = false
