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
		require("nvim-tree").setup({})
		vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", { desc = "Toggle NvimTree to File" })
	end,
}
