local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "gopls", "tailwindcss", "jdtls", "prismals" }
-- local servers = { "lua_ls", "tailwindcss" }

lspconfig.angularls.setup {}

require("aerial").setup({
    layout = {
        resize_to_content = true,
    },
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        -- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        -- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")


lspconfig.csharp_ls.setup {
    init_options = {
        AutomaticWorkspaceInit = true
    },
    capabilities = capabilities,
    on_attach = on_attach,
}

lspconfig.clangd.setup {
    capabilities = capabilities,
    offsetEncoding = { "utf-8" },
    on_attach = on_attach,
}

lspconfig.ts_ls.setup {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true)
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
