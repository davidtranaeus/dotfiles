require('gitsigns').setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        -- focus window with <C-w> w
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, bufopts)
    end,
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
    }
})
