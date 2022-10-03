vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.expandtab = true -- always insert spaces
vim.o.shiftwidth = 4 -- the indent amount
vim.o.autoindent = true -- same indent as last row
vim.o.smartindent = true -- for dicts etc.

vim.cmd [[
    filetype indent off " dont load indent file for file types
]]

vim.diagnostic.config({virtual_text = false})
vim.o.completeopt="menuone,noselect"

-- remap -> options that makes mapings work recursively (on by default)
local opts = { noremap=true, silent=true }
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
