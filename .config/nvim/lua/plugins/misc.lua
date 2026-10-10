return {
    'sainnhe/edge',
    'catppuccin/nvim',

    'Julian/lean.nvim',
    'daveyarwood/vim-alda',
    {
        'Olical/conjure',
        init = function()
            vim.g['conjure#log#hud#open_before_first_eval'] = false
            vim.g['conjure#mapping#doc_word'] = false
        end
    },

    'jiangmiao/auto-pairs',
    'tpope/vim-endwise' -- the nvim version doesnt work
}
