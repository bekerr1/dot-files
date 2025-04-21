return {
	{
		"neovim/nvim-lspconfig",
		event = 'BufReadPre',
		config = function()
			local lspconfig = require("lspconfig")
			local utils = require("lspconfig/util")
			local conf = require("brendank.configs.nvim-lspconfig")

			-- Configure the gopls server
			lspconfig.gopls.setup({
				on_attach = conf.on_attach,
				capabilities = conf.capabilities,
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = utils.root_pattern("go.work", "go.mod", ".git"),
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
			})

			-- Configure the rust server
			lspconfig.rust_analyzer.setup({
				on_attach = conf.on_attach,
				capabilities = conf.capabilities,
				filetypes = { "rust" },
				root_dir = utils.root_pattern("Cargo.toml", "rust-project.json"),
			})

			--lspconfig.solargraph.setup({
			--	on_attach = conf.on_attach,
			--	capabilities = conf.capabilities,
			--	filetypes = { "ruby", "eruby", "vagrantfile" },
			--	---root_dir = utils.root_pattern("Gemfile", ".git"),
			--	cmd = { os.getenv("HOME") .. "/.gem/ruby/bin/solargraph", "stdio" },

			--	settings = {
			--		solargraph = {
			--			autoformat = false,
			--			diagnostics = false,
			--			formatting = false,
			--		},
			--	},
			--})
		end,
	},
}
