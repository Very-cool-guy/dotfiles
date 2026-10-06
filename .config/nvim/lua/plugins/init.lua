return {
    'sainnhe/everforest',
    'sainnhe/edge',
    'catppuccin/nvim',

    { 'nvim-treesitter/nvim-treesitter', lazy = false },
    { 'nvim-neo-tree/neo-tree.nvim', dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim', 'nvim-tree/nvim-web-devicons' } },
    'nvim-telescope/telescope.nvim',
    'jiangmiao/auto-pairs',
    'daveyarwood/vim-alda',
    { 'kylechui/nvim-surround', event = "VeryLazy" },
    'karb94/neoscroll.nvim',
    'Julian/lean.nvim',
    { 'sahaj-b/brainrot.nvim', event = "VeryLazy", opts = {}, dependencies = { { '3rd/image.nvim', opts = {} } } },
    'tpope/vim-endwise',
    { 'folke/noice.nvim', opts = { lsp = { progress = { enabled = false } } }, dependencies = { 'rcarriga/nvim-notify' } },
    { 'saghen/blink.cmp', dependencies = { 'rafamadriz/friendly-snippets' }, version = '1.*', opts = { sources = { default = { 'path', 'snippets', 'buffer' } } } },
    { 'mason-org/mason-lspconfig.nvim', opts = { handlers = { function (server_name) require('lspconfig')[server_name].setup() end } }, dependencies = { { 'mason-org/mason.nvim', opts = {} }, 'neovim/nvim-lspconfig' } },
    { 'nvim-lualine/lualine.nvim', event = "VeryLazy", opts = {
          options = { theme = function() return vim.g.todays_theme end },
          sections = {
            lualine_a = {''},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return require("noice").api.status.command.has() end,
              },
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return require("noice").api.status.mode.has() end,
              },
              'filetype'
            },
            lualine_y = {'location'},
            lualine_z = {},
          },
    } }
}
