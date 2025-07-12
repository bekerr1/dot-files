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

-- Smart navigation for markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "rst", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false

		vim.keymap.set("n", "j", "gj", { buffer = true, silent = true })
		vim.keymap.set("n", "k", "gk", { buffer = true, silent = true })
		vim.keymap.set("n", "0", "g0", { buffer = true, silent = true })
		vim.keymap.set("n", "$", "g$", { buffer = true, silent = true })
		vim.keymap.set("n", "^", "g^", { buffer = true, silent = true })
		---- optional: better horizontal motions
		--vim.keymap.set("n", "w", "gw", { buffer = true, silent = true })
		--vim.keymap.set("n", "b", "gb", { buffer = true, silent = true })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		local buf = args.buf
		if vim.bo[buf].buftype ~= "" then
			return
		end -- Skip special buffers like diffs

		local cwd = vim.loop.cwd() -- get current working directory
		local file_path = vim.fn.expand("%:p") -- full path of current file

		if file_path == "" then
			return -- no file (e.g. no name buffer), skip
		end

		-- Check if file_path starts with cwd
		if not file_path:find(cwd, 1, true) then
			-- File is outside cwd, so change cwd to file's directory
			local file_dir = vim.fn.fnamemodify(file_path, ":h")
			vim.cmd("lcd " .. vim.fn.fnameescape(file_dir))
			-- optionally print message for debugging:
			-- print("Changed cwd to " .. file_dir)
		end
	end,
})
