return {
	{
		"nvimdev/indentmini.nvim",
		event = "BufEnter",
		config = function()
			require("indentmini").setup({
				char = "│", -- Indent character
			})
			vim.cmd("hi IndentLine guifg=#3a3a3a ctermfg=236")
			vim.cmd("hi IndentLineCurrent guifg=#4a4a4a ctermfg=238")
		end,
	},
}
