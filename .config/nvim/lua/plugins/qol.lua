return {
    'karb94/neoscroll.nvim',

    { 'kylechui/nvim-surround', event = "VeryLazy" },

    {
        'sahaj-b/brainrot.nvim', -- peak
        event = "VeryLazy",
        dependencies = { { '3rd/image.nvim', opts = {} } },
        opts = {} 
    }
}
