local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
-- local servers = {"html", "lua_ls","tailwindcss"}
local servers = { "lua_ls" }

lspconfig.csharp_ls.setup {
  init_options = {
    AutomaticWorkspaceInit = true
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    offset_encoding = 'utf-16'
}

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    vim.lsp.inlay_hint.enable(bufnr, true)
    client.server_capabilities.documentFormattingProvider = false
  end
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

require("mason-lspconfig").setup()

-- lspconfig.lua_ls.setup {
--   capabilities = capabilities,
--   filetypes = {
--     "lua",
--   },
--   settings = {
--     Lua = {
--       hint = { enable = true },
--     }
--   }
-- }
-- lspconfig.tsserver.setup {
--   capabilities = capabilities,
-- }
--
-- lspconfig.html.setup {
--   capabilities = capabilities,
-- }
--
-- lspconfig.pylsp.setup {
--   capabilities = capabilities,
-- }
--
-- lspconfig.ast_grep.setup {
--   capabilities = capabilities,
--   filetypes = {
--     "java",
--     "css",
--   }
-- }
--
-- lspconfig.vuels.setup {
--   capabilities = capabilities,
--   filetypes = {
--     "vue",
--   }
-- }
--
-- lspconfig.tailwindcss.setup {
--   capabilities = capabilities,
--   filetypes = {
--     "vue",
--   }
-- }

--lspconfig.clangd.setup {
 -- on_attach = function(client, bufnr)
  --  client.server_capabilities.signatureHelpProvider = false
   -- on_attach(client, bufnr)
--  end,
--  capabilities = capabilities,
--}
