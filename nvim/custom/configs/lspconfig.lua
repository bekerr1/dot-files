local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach 
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local utils  = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
    }
  }
}

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false 
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
}
