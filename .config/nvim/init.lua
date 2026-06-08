vim.cmd([[
set nocompatible
syntax on
set encoding=utf-8
filetype plugin on

set showmatch

set linebreak
set scrolloff=1
set sidescrolloff=5

set nonumber
set relativenumber
set cursorline

set hlsearch
set incsearch
set ignorecase
nnoremap <CR> :noh<CR><CR>:<backspace>

set smartindent
set autoindent
set expandtab

set backspace=indent,eol,start
let maplocalleader = ","
let mapleader = " "
nmap j gj
nmap k gk
inoremap <expr> <Down> v:count == 0 ? "\<Cmd>normal! gj\<CR>" : "\<Down>"
inoremap <expr> <Up>   v:count == 0 ? "\<Cmd>normal! gk\<CR>" : "\<Up>"
inoremap jk <esc>

set noerrorbells
set novisualbell

call plug#begin()
Plug 'sainnhe/everforest'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'daveyarwood/vim-alda'
Plug 'saghen/blink.cmp', { 'tag': 'v1.*' }
Plug 'rafamadriz/friendly-snippets'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'kylechui/nvim-surround'
Plug 'karb94/neoscroll.nvim'
Plug 'folke/noice.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'Olical/conjure'
call plug#end()

set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
set foldlevelstart=99
]])

require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
  },
})

require('lualine').setup({
  options = { theme = 'everforest' },
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
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning"
  }
})

require('nvim-treesitter.config').setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript" },

  sync_install = false,

  auto_install = true,

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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

vim.keymap.set('n', 'K', '<CMD>normal! K<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>s', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>', { noremap = true, silent = true })

vim.opt.showmode = false

vim.cmd("colorscheme everforest")
-- vim.cmd("autocmd VimEnter * Neotree show")
