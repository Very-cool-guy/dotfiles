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

local Plug = vim.fn['plug#']
vim.fn['plug#begin']()
Plug 'sainnhe/everforest' -- cant pick one
Plug 'sainnhe/edge'
Plug 'catppuccin/nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rcarriga/nvim-notify'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'daveyarwood/vim-alda'
Plug 'saghen/blink.cmp'
Plug 'rafamadriz/friendly-snippets'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kylechui/nvim-surround'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/noice.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'Julian/lean.nvim'
-- Plug 'NeogitOrg/neogit'
-- Plug 'Olical/conjure'
vim.fn['plug#end']()

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

local themes = { "everforest", "catppuccin-latte", "edge" }
local utc_time = os.time(os.date("!*t"))
local hk_time = utc_time + 28800
local hk_date = tonumber(os.date("!%Y%m%d", hk_time))
math.randomseed(hk_date)
local todays_theme = themes[math.random(#themes)]

require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
  },
})

require('lualine').setup({
  options = { theme = todays_theme },
  sections = {
    lualine_a = {''},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {
      {
        require("noice").api.status.command.get,
        cond = require("noice").api.status.command.has,
      },
      {
        require("noice").api.status.mode.get,
        cond = require("noice").api.status.mode.has,
      },
      'filetype'
    },
    lualine_y = {'location'},
    lualine_z = {},
  },
})

require('blink.cmp').setup({
  sources = {
    default = { 'path', 'snippets', 'buffer' },
  },
})

require('nvim-treesitter.config').setup({ -- i installed every parser
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "pyright" },
    handlers = {
        function (server_name)
            require("lspconfig")[server_name].setup()
        end,
    },
})

vim.keymap.set('n', 'K', '<CMD>normal! K<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', { noremap = true, silent = true })

vim.opt.showmode = false

vim.cmd.colorscheme(todays_theme)
-- vim.cmd("autocmd VimEnter * Neotree show")
