-- vim.opt.rtp:append("~/.config/nvim-new")
-- vim.opt.rtp:append("~/.local/share/nvim-new/mason")

-- basics
require("brendank.configs.options")
require("brendank.configs.autocmds")
require("brendank.configs.keymaps")
require("brendank.configs.nvim-lspconfig")

-- lazy
require("brendank.configs.lazy")
