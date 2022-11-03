require("gitsigns").setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, bufopts)
    vim.keymap.set({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>", bufopts)
    vim.keymap.set({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>", bufopts)
  end,
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
  }
})
