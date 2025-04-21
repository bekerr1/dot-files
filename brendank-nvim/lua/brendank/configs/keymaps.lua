M = {}

-- Helpers
local noremap = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
local map = function(mode, lhs, rhs)
	vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end
local vimmap = vim.keymap.set

-- Quick movement
noremap("n", "J", "15jzz")
noremap("n", "K", "15kzz")
noremap("n", "n", "nzz")
noremap("n", "N", "Nzz")
noremap("n", "d", '"_d')
noremap("n", "dd", '"_dd')
noremap("v", "p", '"0p')
noremap("i", "<C-x>", "<C-e>")

-- Disable command-line and search history windows
noremap("n", "q:", "<Nop>")
noremap("n", "q/", "<Nop>")
noremap("n", "q?", "<Nop>")

-- Saving
map("n", "ss", ":w<CR>")
map("n", "QQ", ":q<CR>")

---- Tab movement
--vimmap("n", "L", function()
--	require("nvchad.tabufline").next()
--end, { desc = "buffer goto next" })
--vimmap("n", "H", function()
--	require("nvchad.tabufline").prev()
--end, { desc = "buffer goto prev" })

-- Diag
map("n", "<space>e", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

function M.nvimtree_keymaps()
	--local api = require("nvim-tree.api")
	return {
		{ "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
	}
end

function M.copilot_keymaps()
	return {
		{ "<leader>cp", ":Copilot panel<CR>", desc = "Copilot panel" },
	}
end

function M.telescope_keymaps()
	--- @param set_cwd boolean
	local function open_file_in_other_project(set_cwd)
		vim.g.project_set_cwd = set_cwd
		require("telescope").extensions.project.project({ display_type = "full", hide_workspace = true })
	end

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

	return {
		{ "<leader>fi", builtin.find_files, desc = "[f]ile f[i]nd" },
		{ "<leader>ff", builtin.current_buffer_fuzzy_find, desc = "[f]uzzy [f]ind" },
		{ "<leader>fg", builtin.live_grep, desc = "[f]ile [g]rep" },
		{ "<leader>fb", builtin.buffers, desc = "[f]ile [b]uffers" },
		{ "<leader>fh", builtin.help_tags, desc = "help tags" },
		{
			"<leader>sf",
			function()
				open_file_in_other_project(false)
			end,
			desc = "[s]earch [f]ile (in projects)",
		},

		-- yank
		-- NOTE: reminder;
		-- Use `vep` to replace current a word with a yank.
		-- Use `Vp` to replace a line with a yank.
		{
			"<leader>p",
			function()
				require("telescope").extensions.yank_history.yank_history({})
			end,
			desc = "Yanky history",
		},

		-- search
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "[s]earch [o]ptions" },
	}
end

return M
