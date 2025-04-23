local M = {}
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
	map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
end

M.on_init = function(client, _)
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "lua_ls", "rust_analyzer" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mason-lspconfig.nvim",
		},
		config = function()
			local cmp_nvim_lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local capabilities = vim.tbl_deep_extend("force", cmp_nvim_lsp_capabilities, M.capabilities)

			require("lspconfig").lua_ls.setup({
				on_attach = M.on_attach,
				capabilities = capabilities,
				on_init = M.on_init,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = {
								vim.api.nvim_get_runtime_file("", true),
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
								"${3rd}/luv/library",
							},
							checkThirdParty = false,
						},
						telemetry = { enable = false },
						completion = { callSnippet = "Replace" },
					},
				},
			})

			require("lspconfig").gopls.setup({
				capabilities = capabilities,
				on_attach = M.on_attach,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
						staticcheck = true,
					},
				},
				root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
			})

			require("lspconfig").rust_analyzer.setup({
				on_attach = M.on_attach,
				capabilities = capabilities,
				root_dir = require("lspconfig/util").root_pattern("Cargo.toml", "rust-project.json"),
			})
		end,
	},
}
