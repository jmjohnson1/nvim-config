vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fj", vim.cmd.Ex)

vim.keymap.set("x", "ga", '<Plug>(EasyAlign)')
vim.keymap.set("n", "ga", '<Plug>(EasyAlign)')

vim.g.mapleader = " "
-- Copy/paste system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')

