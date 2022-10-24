local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.config/nvim/plugged")

Plug "projekt0n/github-nvim-theme"

Plug "neovim/nvim-lspconfig"
Plug "williamboman/mason.nvim"
Plug "jose-elias-alvarez/null-ls.nvim"
Plug "nvim-lua/plenary.nvim" -- required by null-ls

-- does the post update hook really work?
Plug('nvim-treesitter/nvim-treesitter', {["do"] = vim.fn[":TSUpdate"]})
-- Plug 'nvim-treesitter/nvim-treesitter-context'

Plug "lewis6991/gitsigns.nvim"

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug('nvim-telescope/telescope.nvim', {["tag"]= '0.1.0' })
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do']= 'make' })
vim.call("plug#end")

require('telescope').load_extension('fzf')
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})

-- netrw articles (the split explorer model)
-- http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
-- https://shapeshed.com/vim-netrw/
-- https://thevaluable.dev/vim-browsing-remote-netrw/

require('gitsigns').setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        -- focus window with <C-w> w
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, bufopts)

        -- Navigation
        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, bufopts)

        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, bufopts)
    end,
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
    }
})

require("github-theme").setup({
    theme_style = "dark"
})

-- uses global nodejs version
require("mason").setup()

require('nvim-treesitter.configs').setup({
    ensure_installed = {"python", "javascript", "typescript", "tsx", "html", "css"},
    highlight = {
      enable = true,
    },
})

-- import on omnifunc https://old.reddit.com/r/neovim/comments/mn8ipa/lsp_add_missing_imports_on_complete_using_the/
-- _G.lsp_import_on_completion = function()
--     local completed_item = vim.v.completed_item
--     if not (
--         completed_item and
--         completed_item.user_data and
--         completed_item.user_data.nvim and
--         completed_item.user_data.nvim.lsp and
--         completed_item.user_data.nvim.lsp.completion_item
--         ) then
--         return
--     end
-- 
--     local item = completed_item.user_data.nvim.lsp.completion_item
--     local bufnr = vim.api.nvim_get_current_buf()
--     vim.lsp.buf_request(bufnr, "completionItem/resolve", item, function(_, result, _)
--         if result and result.additionalTextEdits then
--             vim.lsp.util.apply_text_edits(result.additionalTextEdits, bufnr, "utf-16")
--         end
--     end)
-- end
-- 
-- -- define autocmd to listen for CompleteDone
-- vim.api.nvim_exec([[
-- augroup LSPImportOnCompletion
--     autocmd!
--     autocmd CompleteDone * lua lsp_import_on_completion()
-- augroup END
-- ]], false)
