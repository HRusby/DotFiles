
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not available")
	return
end

local servers = { "rust_analyzer", "jsonls", "lua_ls", "pyright", "yamlls", "volar", "bashls", "omnisharp" }
for _, server in ipairs(servers) do
  local opts = {
    on_attach = require("user/lsp/handlers").on_attach,
    capabilities = require("user/lsp/handlers").capabilities,
  }
  local server_opts = require("user/lsp/settings/"..server)
  opts = vim.tbl_deep_extend("force", server_opts, opts)
  lspconfig[server].setup(opts)
end
