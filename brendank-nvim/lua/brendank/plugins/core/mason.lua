vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		version = "1.11.0",
		dependencies = {
			{
				"zapling/mason-lock.nvim",
				-- opts = {
				-- 	lockfile_path = require("fredrik.utils.environ").getenv("DOTFILES")
				-- 		.. "/nvim-fredrik/mason-lock.json",
				-- },
			},
			{
				"nvim-lualine/lualine.nvim",
				opts = {
					extensions = { "mason" },
				},
			},
			-- {
			-- 	"williamboman/mason-lspconfig.nvim",
			-- 	version = "1.29.0",
			-- },
		},

		---@class MasonSettings
		opts = {
			-- registries = { "path:/tmp/mason-registry/" },
			-- log_level = vim.log.levels.DEBUG,
			-- Where Mason should put its bin location in your PATH. Can be one of:
			-- - "prepend" (default, Mason's bin location is put first in PATH)
			-- - "append" (Mason's bin location is put at the end of PATH)
			-- - "skip" (doesn't modify PATH)
			---@type '"prepend"' | '"append"' | '"skip"'
			PATH = "append", -- picks tooling from local environment first
			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},
			max_concurrent_installers = 5,
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local registry = require("mason-registry")
			registry.refresh(function()
				if opts.ensure_installed == nil then
					return
				end

				for _, pkg_name in ipairs(opts.ensure_installed) do
					local pkg = registry.get_package(pkg_name)
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end)
		end,
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate", "MasonUninstall" },
	},
}
