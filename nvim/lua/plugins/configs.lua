require("github-theme").setup({ theme_style = "dark" })

require("mason").setup()

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- focus window with <C-w> w
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, bufopts)
    vim.keymap.set({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>", bufopts)
    vim.keymap.set({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>', bufopts)
  end,
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
  }
})

require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "python",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "jsonnet",
    "dockerfile",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})
