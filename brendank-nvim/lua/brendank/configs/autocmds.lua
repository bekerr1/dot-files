-- Create a function to set tabstop and shiftwidth easily
local set_indent = function(tabstop, shiftwidth, expandtab)
	vim.bo.tabstop = tabstop -- Number of spaces a <Tab> counts for
	vim.bo.shiftwidth = shiftwidth -- Number of spaces used for autoindent
	vim.bo.expandtab = expandtab -- Use spaces instead of tabs (true) or tabs (false)
end

-- Autocmd group to handle filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		-- Best practice for Go: tabs, width of 4
		set_indent(4, 4, false) -- Go uses actual tab characters, 4 spaces
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- Best practice for Python: spaces, width of 4
		set_indent(4, 4, true) -- Python uses spaces, 4 spaces per indent (PEP8)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "bash", "zsh" },
	callback = function()
		-- Best practice for Bash/Shell scripts: spaces, width of 2
		set_indent(2, 2, true) -- Bash uses spaces, 2 spaces per indent
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h" },
	callback = function()
		set_indent(4, 4, true) -- C/C++ typically uses actual tabs, 4 spaces per indent
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		-- Best practice for Rust: spaces, width of 4
		set_indent(4, 4, true) -- Rust uses spaces, 4 spaces per indent
	end,
})
