local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

Plug "projekt0n/github-nvim-theme"

Plug "dstein64/vim-startuptime"
Plug "neovim/nvim-lspconfig"
Plug "williamboman/mason.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
Plug "nvim-lua/plenary.nvim"

Plug("nvim-treesitter/nvim-treesitter", {
  ["commit"] = "4cccb6f494eb255b32a290d37c35ca12584c74d0",
})

Plug "lewis6991/gitsigns.nvim"

Plug "hrsh7th/nvim-cmp"
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

require("plugins.configs")
require("plugins.lsp")
