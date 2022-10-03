-- Attach buffer settings after the LS attaches
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    -- for formatters which does not support ranged formatting (black)
    vim.keymap.set("n", "<leader>gq", vim.lsp.buf.formatting, bufopts)
    -- vim.keymap.set("v", "gq", vim.lsp.buf.range_formatting, bufopts)
end

--local cmp = require'cmp'
--cmp.setup({
--    window = {
--      documentation = cmp.config.disable
--    },
--    mapping = cmp.mapping.preset.insert({
--        -- set to true if enter should default to first option
--        ['<CR>'] = cmp.mapping.confirm({ select = false }),
--    }),
--    sources = cmp.config.sources(
--        {
--            { name = 'nvim_lsp', keyword_length = 3 },
--        }, 
--        {
--            { name = 'buffer', keyword_length = 3 },
--        }
--    ),
--    completion = {
--        autocomplete = false,
--    }
--})
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup({
        on_attach = on_attach,
    })
end

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8, -- black does not support ranged formatting
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
    },
    on_attach = on_attach,
})

