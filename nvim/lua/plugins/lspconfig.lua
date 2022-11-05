local utils = require("plugins.utils")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "tsserver" }

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = utils.on_attach,
    capabilities = capabilities,
  })
end

require("lspconfig").sumneko_lua.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
        -- High CPU without this https://github.com/sumneko/lua-language-server/issues/1408
        workspaceDelay = -1,
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        -- I don't use snippets
        keywordSnippet = "Disable",
      }
    },
  },
}
