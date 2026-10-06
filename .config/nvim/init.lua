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
vim.keymap.set("n", "j", "gj", { remap = true })
vim.keymap.set("n", "k", "gk", { remap = true })
vim.keymap.set({"n","i"}, "<Down>", "<Cmd>normal! gj<CR>")
vim.keymap.set({"n","i"}, "<Up>",   "<Cmd>normal! gk<CR>")

vim.opt.errorbells = false

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
require("lazy").setup("plugins")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

local themes = { "everforest", "catppuccin-latte", "edge" }
local utc_time = os.time(os.date("!*t"))
local hk_time = utc_time + 28800
local hk_date = tonumber(os.date("!%Y%m%d", hk_time))
math.randomseed(hk_date)
for _ = 1, 12 do math.random() end -- the prng sucks
todays_theme = themes[math.random(#themes)]
vim.g.todays_theme = todays_theme

Map = vim.keymap.set -- i dont need noremap cuz i dont have many maps

Map('c', 'Q!', 'q!') -- i keep accidentally doing this!!!

Map('n', '<leader>s', function()
    require('telescope.builtin').lsp_document_symbols()
end)
Map('n', '<leader>e', vim.diagnostic.open_float)
Map('n', '<leader>t', ':Neotree toggle<CR>')

Map('n', '<leader>bn', ':rightbelow vnew<CR>')
Map('n', '<leader>bb', ':rightbelow new<CR>')
Map('n', '<leader>bc', '<C-w>w')

Map('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>')

vim.opt.showmode = false

vim.cmd.colorscheme(todays_theme)
