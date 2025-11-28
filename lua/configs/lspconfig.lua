local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "html",
  "cssls",
  "clangd",
  "ts_ls",
  "pyright",
  "gopls",
  "bashls",
  "lua_ls",
  "ltex_plus",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end
