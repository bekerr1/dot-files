return {
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("marks").setup(opts)
		end,
	},
}
