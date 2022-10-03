local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")
Plug("junegunn/fzf", {["do"] = vim.fn["fzf#install"]})
Plug "junegunn/fzf.vim"

Plug "projekt0n/github-nvim-theme"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/mason.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
Plug "nvim-lua/plenary.nvim" -- required by null-ls

-- does the post update hook really work?
Plug('nvim-treesitter/nvim-treesitter', {["do"] = vim.fn[":TSUpdate"]})

Plug "lewis6991/gitsigns.nvim"

Plug "tpope/vim-surround"

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug "lifepillar/vim-mucomplete"
vim.call("plug#end")

require('gitsigns').setup({
    on_attach = function(bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        -- focus window with <C-w> w
        vim.keymap.set("n", "<leader>hp", package.loaded.gitsigns.preview_hunk, bufopts)
    end,
    preview_config = {
        border = false,
    }
})

require("github-theme").setup({
    theme_style = "light"
})

-- uses global nodejs version
require("mason").setup()

require('nvim-treesitter.configs').setup({
    ensure_installed = {"python", "javascript"},
    sync_install = false,
    highlight = {
        enable = true,
    }
})

-- import on omnifunc https://old.reddit.com/r/neovim/comments/mn8ipa/lsp_add_missing_imports_on_complete_using_the/
