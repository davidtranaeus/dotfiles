vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true

-- https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
-- remap -> options that makes mapings work recursively (on by default)
-- :map and :noremap are recursive and non-recursive mapping commands
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
