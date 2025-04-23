return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy", -- Load after startup
		opts = {
			options = {
				mode = "buffers", -- Use buffers for bufferline
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = "thin", -- Clean line style
				offsets = {
					{
						filetype = "NvimTree", -- Adjust for your file explorer
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			vim.o.showtabline = 2 -- Ensure tabline is always shown
			-- Keymaps for cycling buffers
			vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>x", ":bnext | bdelete #<CR>", { noremap = true, silent = true })
		end,
	},
}
