return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				rust = { "rustfmt" },
				sh = { "shfmt" },
				json = { "jq" },
				yaml = { "prettier" },
				c = { "clang_format" },
				cpp = { "clang_format" },
			},
			formatters = {
				clang_format = {
					command = "clang-format",
					args = '--style="{BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4, UseTab: Never}"',
				},
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			--log_level = vim.log.levels.DEBUG,
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},
}
