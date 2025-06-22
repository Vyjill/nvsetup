require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

require("lspconfig").pyright.setup({})
require("lspconfig").clangd.setup({})

-- read :h vim.lsp.config for changing options of lsp servers
