vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.completeopt = "menu"
vim.g.mapleader = " "
vim.o.expandtab = true -- always insert spaces
vim.o.shiftwidth = 4 -- the indent amount
vim.o.autoindent = true -- same indent as last row
vim.o.smartindent = true -- for dicts etc.

vim.cmd [[
    filetype indent off " dont load indent file for file types
]]

-- Key mapings
-- remap -> options that makes mapings work recursively (on by default)
-- :map and :noremap are recursive and non-recursive mapping commands
local opts = { noremap=true, silent=true }
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)


local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")
-- fzf is a fuzzy finder (using find as default command?) without any pre-made
-- vim key bindings
-- ripgrep is a search tool using regex patterns
-- fzf.vim is a vim plugin which integrates fzf in vim for searching for files
-- (find?) and for content (ripgrep)
Plug("junegunn/fzf", {["do"] = vim.fn["fzf#install"]})
Plug "junegunn/fzf.vim"

Plug "projekt0n/github-nvim-theme"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/mason.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
Plug "nvim-lua/plenary.nvim" -- required by null-ls

-- does the post update hook really work?
Plug('nvim-treesitter/nvim-treesitter', {["do"] = vim.fn[":TSUpdate"]})


-- Plug "mhinz/vim-signify"
Plug "lewis6991/gitsigns.nvim"

Plug "tpope/vim-surround"
vim.call("plug#end")

require('gitsigns').setup({
    on_attach = function(bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        -- focus window with <C-w> w
        vim.keymap.set("n", "<leader>hp", package.loaded.gitsigns.preview_hunk, bufopts)
    end
})

require("github-theme").setup({
    theme_style = "light"
})

-- Attach buffer settings after the LS attaches
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    -- for formatters which does not support ranged formatting (black)
    vim.keymap.set("n", "<leader>gq", vim.lsp.buf.formatting, bufopts)
    -- vim.keymap.set("v", "gq", vim.lsp.buf.range_formatting, bufopts)
end

-- lsp config for various servers: https://github.com/neovim/nvim-lspconfig
-- Add a pyrightconfig.json for venv settings
-- { "venv" : "name of virtual env", "venvPath" : "/Users/name/.pyenv/versions" }
require("lspconfig").pyright.setup{
    on_attach = on_attach,
}
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
})

vim.diagnostic.config({virtual_text = false})

-- null-ls, run traditional command line tools through lsp
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8, -- black does not support ranged formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
    },
})

-- nvim package manager for lsp, dap, linters, formatters
-- uses global nodejs version
require("mason").setup()

-- :TSInstall python
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    }
})
