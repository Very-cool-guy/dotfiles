return {
   { 'nvim-treesitter/nvim-treesitter', lazy = false },

   {
      'mason-org/mason-lspconfig.nvim',
      opts = {
         handlers = {
            function (server_name)
               require('lspconfig')[server_name].setup()
            end 
        }
      },
      dependencies = {
         { 'mason-org/mason.nvim', opts = {} },
         'neovim/nvim-lspconfig'
      }
   }
}
