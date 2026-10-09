vim.opt.showmatch = true
vim.opt.ignorecase = true

vim.opt.linebreak = true
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.smartindent = true
vim.opt.expandtab = true

vim.g.maplocalleader = ","
vim.g.mapleader = " "

vim.opt.guicursor:append("ci:block") -- makes the cursor shape not change in command mode

vim.opt.errorbells = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

vim.opt.showmode = false
