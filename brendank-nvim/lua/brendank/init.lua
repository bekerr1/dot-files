-- vim.opt.rtp:append("~/.config/nvim-new")
-- vim.opt.rtp:append("~/.local/share/nvim-new/mason")

-- basics
require("brendank.configs.options")
require("brendank.configs.autocmds")
require("brendank.configs.keymaps")

-- lazy
require("brendank.configs.lazy")

--vim.lsp.config("luals", {
--	cmd = { "lua-language-server" },
--	filetypes = { "lua" },
--	root_markers = { ".luarc.json", ".luarc.jsonc" },
--})
