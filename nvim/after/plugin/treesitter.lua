require("nvim-treesitter.configs").setup({
    ensure_installed = {"python", "javascript", "typescript", "tsx", "html", "css"},
    highlight = {
      enable = true,
    },
})
