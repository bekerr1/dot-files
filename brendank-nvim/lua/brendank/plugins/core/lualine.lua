-- local function folder()
-- 	local cwd = vim.fn.getcwd()
-- 	local foldername = cwd:match("([^/]+)$")
-- 	return foldername
-- end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	-- dependencies = {
	-- 	"zbirenbaum/copilot.lua",
	-- },
	-- opts = {
	--
	-- 	-- see copilot.lua...
	-- 	-- copilot = {
	-- 	--   lualine_component = "filename",
	-- 	-- },
	-- 	--
	-- 	-- see debug.lua...
	-- 	-- dap_status = {
	-- 	--  lualine_component = "filename",
	-- 	--  },
	-- 	--
	-- 	-- see noice.lua...
	-- 	-- noice = {
	-- 	--   lualine_component = "filename",
	-- 	-- },
	--
	-- 	options = {
	-- 		theme = "auto",
	-- 		component_separators = { left = "", right = "" },
	-- 		section_separators = { left = "", right = "" },
	-- 		globalstatus = true,
	-- 		disabled_filetypes = {},
	-- 	},
	--
	-- 	sections = {
	-- 		lualine_a = { "mode" },
	-- 		lualine_b = {
	-- 			{
	-- 				"branch",
	-- 				fmt = function(str)
	-- 					local slash_index = str:find("/")
	-- 					if slash_index then
	-- 						return str:sub(1, slash_index) .. "..."
	-- 					elseif #str > 12 then
	-- 						return str:sub(1, 9) .. "..."
	-- 					else
	-- 						return str
	-- 					end
	-- 				end,
	-- 			},
	-- 			"diagnostics",
	-- 		},
	-- 		lualine_c = {
	-- 			{ folder, color = { gui = "bold" }, separator = "/", padding = { left = 1, right = 0 } },
	-- 			{ "filename", path = 1, padding = { left = 0, right = 1 } },
	-- 		},
	-- 		lualine_x = { "encoding", "filetype" },
	-- 		lualine_y = { "progress" },
	-- 		lualine_z = { "location" },
	-- 	},
	--
	-- 	extensions = { "lazy", "man", "quickfix" },
	-- },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
	end,
	-- opts_extend = {
	-- 	"options.disabled_filetypes",
	-- 	"sections.extensions",
	-- },
	-- config = function(_, opts)
	-- 	-- TODO: make more generic insertion function which can insert anywhere.
	-- 	if opts.copilot then
	-- 		table.insert(opts.sections.lualine_x, 1, opts.copilot.lualine_component)
	-- 	else
	-- 		vim.notify("Lualine: copilot component not loaded", vim.log.levels.WARN)
	-- 	end
	--
	-- 	if opts.dap_status then
	-- 		table.insert(opts.sections.lualine_x, 2, opts.dap_status.lualine_component)
	-- 	else
	-- 		vim.notify("Lualine: dap_status component not loaded", vim.log.levels.WARN)
	-- 	end
	--
	-- 	if opts.noice then
	-- 		table.insert(opts.sections.lualine_x, 3, opts.noice.lualine_component)
	-- 	else
	-- 		vim.notify("Lualine: noice component not loaded", vim.log.levels.WARN)
	-- 	end
	--
	-- 	require("lualine").setup(opts)
	-- end,
}
