M = {}

function M.fgcolor(name)
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name, link = false })
	local fg = hl and hl.fg
	return fg and { fg = string.format("#%06x", fg) } or nil
end

return M
