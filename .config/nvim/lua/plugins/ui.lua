return {
   {
      'folke/noice.nvim', 
      opts = {
         lsp = {
            progress = { enabled = false }
         }
      },
      dependencies = { 'rcarriga/nvim-notify' }
   },

   {
      'saghen/blink.cmp',
      opts = {
         sources = {
            default = { 'path', 'snippets', 'buffer' }
         }
      },
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '1.*' 
   },

   {
      'nvim-lualine/lualine.nvim',
      event = "VeryLazy",
      opts = {
         options = { theme = function() return vim.g.todays_theme end },
         sections = {
            lualine_a = {},
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
            lualine_z = {}
         }
      }
   }
}
