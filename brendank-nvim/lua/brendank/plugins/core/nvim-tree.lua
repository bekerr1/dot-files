-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

return {
	"nvim-tree/nvim-tree.lua",
	version = "1.12.0",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			update_cwd = false, -- Don't change global cwd automatically
			respect_buf_cwd = true, -- Open tree at current buffer's directory
			sync_root_with_cwd = false, -- Disable syncing root with global cwd

			update_focused_file = {
				enable = true, -- Keep tree focused on current file
				update_cwd = false, -- Don't change cwd on file change
				ignore_list = {}, -- Files to ignore
			},

			actions = {
				open_file = {
					quit_on_open = false, -- Keep tree open when opening a file
					resize_window = true,
					window_picker = {
						enable = true,
					},
				},
			},
		})

		vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree to File" })
	end,
}

---return {
---	"nvim-tree/nvim-tree.lua",
---	version = "1.12.0",
---	lazy = false,
---	dependencies = {
---		"nvim-tree/nvim-web-devicons",
---	},
---	config = function()
---		require("nvim-tree").setup({})
---		vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree to File" })
---	end,
---}
