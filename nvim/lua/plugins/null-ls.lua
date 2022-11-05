local utils = require("plugins.utils")

local null_ls = require("null-ls")
local builtins = null_ls.builtins

null_ls.setup({
  sources = {
    builtins.formatting.autopep8,
    builtins.formatting.black,
    builtins.formatting.isort,
    builtins.formatting.prettier,
    builtins.diagnostics.flake8,
    builtins.diagnostics.stylelint,
    builtins.diagnostics.jsonlint,
  },
  on_attach = utils.on_attach,
})
