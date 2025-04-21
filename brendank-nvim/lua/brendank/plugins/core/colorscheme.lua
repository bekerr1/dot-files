return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false, -- Load at startup
		priority = 1000, -- Load before other plugins
		config = function()
			vim.cmd("colorscheme kanagawa-dragon") -- Set colorscheme
		end,
	},
}
