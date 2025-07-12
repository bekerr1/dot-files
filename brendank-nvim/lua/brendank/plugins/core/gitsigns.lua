return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},

		attach_to_untracked = true,
		current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 300,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},

		yadm = { enable = false },
	},

	keys = {
		{
			"]c",
			function()
				require("gitsigns").next_hunk()
			end,
			desc = "Next Git hunk",
		},
		{
			"[c",
			function()
				require("gitsigns").prev_hunk()
			end,
			desc = "Prev Git hunk",
		},
		{
			"<leader>hs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage hunk",
		},
		{
			"<leader>hr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset hunk",
		},
		{
			"<leader>hp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk",
		},
		{
			"<leader>hb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Blame line",
		},
		{
			"<leader>hd",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "Git diff against index",
		},
		{
			"<leader>hD",
			function()
				if vim.wo.diff then
					vim.cmd("diffoff!")
					vim.cmd("wincmd o") -- Close all other splits
				else
					require("gitsigns").diffthis("~") -- Diff against HEAD
				end
			end,
			desc = "Toggle git diff against last commit",
		},
	},
}
