utils = require("plugins.utils")

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "tsserver" }

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = utils.on_attach,
    capabilities = capabilities,
  })
end
