Map = vim.keymap.set -- i dont need noremap cuz i dont have many maps

Map("n", "j", "gj", { remap = true })
Map("n", "k", "gk", { remap = true })
Map({"n","i"}, "<Down>", "<Cmd>normal! gj<CR>")
Map({"n","i"}, "<Up>",   "<Cmd>normal! gk<CR>")

Map('c', 'Q!', 'q!') -- i keep accidentally doing this!!!

Map('n', '<leader>s', function()
    require('telescope.builtin').lsp_document_symbols()
end)
Map('n', '<leader>e', vim.diagnostic.open_float)
Map('n', '<leader>t', ':Neotree toggle<CR>')

Map('n', '<leader>n', ':rightbelow vnew<CR>')
Map('n', '<leader>b', ':rightbelow new<CR>')
Map('n', '<leader>c', '<C-w>w')

Map('n', '<Esc>', '<cmd>nohlsearch<CR><Esc>')

Map('n', 'U', '<C-r>')
