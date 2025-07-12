return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local lga_actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob",
					"!**/.git/*",
					"--glob",
					"!**/node_modules/*",
				},
			},
			extensions = {
				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
		})

		telescope.load_extension("live_grep_args")

		-- Custom command to grep multiple base dirs
		vim.api.nvim_create_user_command("GrepProject", function()
			local base_dirs = {
				"~/Development",
				".git",
				"~/dev",
				"~/.config/nvim",
			}

			-- Expand paths
			local expanded_dirs = vim.tbl_map(function(dir)
				return vim.fn.expand(dir)
			end, base_dirs)

			require("telescope").extensions.live_grep_args.live_grep_args({
				search_dirs = expanded_dirs,
			})
		end, { desc = "Live Grep in base project dirs" })
	end,
	keys = require("brendank.configs.keymaps").telescope_keymaps(),
}

--local paths = {
--	vim.fn.getcwd(),
--	".git",
--	"~/Development",
--	"~/dev",
--}
--
--local function is_valid_dir(path)
--	return vim.fn.isdirectory(vim.fn.expand(path)) == 1
--end
--
--local base_dirs = {}
--
--for _, path in ipairs(paths) do
--	if is_valid_dir(path) then
--		table.insert(base_dirs, { path = vim.fn.expand(path), max_depth = 3 })
--	end
--end
--
--return {
--	{
--		"nvim-telescope/telescope.nvim",
--		lazy = true,
--		event = "VeryLazy",
--		version = "*",
--		dependencies = {
--			{ "nvim-lua/plenary.nvim" },
--			{ "nvim-telescope/telescope-ui-select.nvim" },
--			{ "nvim-telescope/telescope-live-grep-args.nvim" },
--			{ "nvim-telescope/telescope-project.nvim" },
--			{ "gbprod/yanky.nvim" },
--		},
--		opts = function(_, opts)
--			-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
--			local custom_opts = {
--				defaults = {
--					vimgrep_arguments = {
--						"rg",
--						"--color=never",
--						"--no-heading",
--						"--hidden",
--						"--with-filename",
--						"--line-number",
--						"--column",
--						"--smart-case",
--						"--trim",
--						"--glob",
--						"!**/.git/*",
--						"--glob",
--						"!**/node_modules/*",
--					},
--					mappings = {
--						-- optionally, use tab to select file(s) and ...
--						i = {
--							-- ["<C-t>"] = require("trouble.sources.telescope").open,
--							-- ["<a-t>"] = require("trouble.sources.telescope").open,
--							-- ["<a-a>"] = require("trouble.sources.telescope").add,
--						},
--					},
--				},
--				extensions = {
--					["ui-select"] = {
--						require("telescope.themes").get_dropdown({}),
--					},
--					project = {
--						base_dirs = base_dirs,
--						cd_scope = { "global", "tab", "window" },
--					},
--				},
--			}
--			return vim.tbl_deep_extend("force", custom_opts, opts)
--		end,
--		config = function(_, opts)
--			local telescope = require("telescope")
--
--			telescope.setup(opts)
--
--			telescope.load_extension("live_grep_args")
--			telescope.load_extension("ui-select")
--			telescope.load_extension("project")
--			telescope.load_extension("yank_history")
--
--			--require("brendank.configs.keymaps").telescope_keymaps()
--		end,
--		keys = require("brendank.configs.keymaps").telescope_keymaps(),
--	},
--}
