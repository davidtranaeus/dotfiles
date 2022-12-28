local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")
Plug "nvim-tree/nvim-tree.lua"
Plug "nvim-tree/nvim-web-devicons"

Plug "bluz71/vim-nightfly-guicolors"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/mason.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
Plug "nvim-lua/plenary.nvim"

Plug("nvim-treesitter/nvim-treesitter")

Plug "lewis6991/gitsigns.nvim"

Plug "hrsh7th/nvim-cmp"
Plug "hrsh7th/vim-vsnip"
Plug "hrsh7th/cmp-nvim-lsp"
Plug "hrsh7th/cmp-buffer"

Plug("nvim-telescope/telescope.nvim", {
  ["tag"] = "0.1.0",
})
Plug("nvim-telescope/telescope-fzf-native.nvim", {
  ["do"] = "make",
})
vim.call("plug#end")
vim.cmd("filetype indent off") -- plug end turns it on

require("plugins.gitsigns")
require("plugins.mason")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.nvim-cmp")
require("plugins.lspconfig")
require("plugins.null-ls")
require("plugins.colorscheme")
require("plugins.nvim-tree")
