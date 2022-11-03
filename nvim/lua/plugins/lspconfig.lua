local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
  vim.keymap.set("n", "<leader>fo", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
