vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.o.expandtab = true -- always insert spaces
vim.o.shiftwidth = 2 -- the indent amount
vim.o.autoindent = true -- same indent as last row
vim.o.smartindent = true -- for dicts etc.
vim.o.signcolumn = "yes" -- prevents the buffer from jumping
vim.o.scrolloff = 10

vim.diagnostic.config({virtual_text = false})
vim.o.completeopt="menuone,noselect"

local opts = { noremap=true, silent=true }
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"*.py"},
  command = "setlocal shiftwidth=4",
})

vim.cmd("filetype indent off") -- default indent is bonkers for py
vim.cmd("command Config e ~/.config/nvim/")

-- nvims py executable for py plugins, :h python-virtualenv
vim.g.python3_host_prog = "~/.pyenv/versions/neovim/bin/python"
