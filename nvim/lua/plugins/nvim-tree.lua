vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>d", ":NvimTreeFindFileToggle<CR>", opts)
