local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim", version = "1.10.0" },
	{ "williamboman/mason-lspconfig.nvim", version = "1.29.0" },
	log_level = vim.log.levels.DEBUG,
})
require("mason").setup()
require("mason-lspconfig").setup()
