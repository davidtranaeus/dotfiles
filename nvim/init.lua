vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true

-- https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
-- remap -> options that makes mapings work recursively (on by default)
-- :map and :noremap are recursive and non-recursive mapping commands
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })


-- Plugins
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Git
Plug 'airblade/vim-gitgutter'
-- Plug 'tpope/vim-fugitive'
-- Plug 'lewis6991/gitsigns.nvim'

-- fzf is a fuzzy finder (using find as default command?) without any pre-made
-- vim key bindings
-- ripgrep is a search tool using regex patterns
-- fzf.vim is a vim plugin which integrates fzf in vim for searching for files
-- (find?) and for content (ripgrep)
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'

vim.call('plug#end')

-- require('gitsigns').setup()
