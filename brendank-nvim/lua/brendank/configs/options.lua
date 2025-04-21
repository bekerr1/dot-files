-- leader key
vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

-- set tab and indents defaults (can be overridden by per-language configs)
vim.opt.tabstop = 4 -- display tabs as 4 spaces
vim.opt.softtabstop = 4 -- insert 4 spaces when tab is pressed
vim.opt.shiftwidth = 4 -- indent << or >> by 4 spaces
vim.opt.expandtab = false -- expand tab into spaces
vim.opt.clipboard = "unnamedplus"

-- Numbers
vim.o.number = true
vim.o.numberwidth = 2
vim.o.ruler = false

-- undo
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold

-- skip startup screen
vim.opt.shortmess:append("I")

-- fillchars
-- vim.opt.fillchars = {
-- 	foldopen = "",
-- 	foldclose = "",
-- 	-- fold = "⸱",
-- 	fold = " ",
-- 	foldsep = " ",
-- 	-- diff = "╱",
-- 	-- diff = "╱",
-- 	diff = "░",
-- 	-- diff = "·",
-- 	eob = " ",
-- }

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- NOTE: do not set a global ruler here, as it will show in undesirable places.
-- Instead, set this in the per-language config files.
-- vim.opt.colorcolumn = "80"

-- incremental search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- ignore case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- text wrap
vim.opt.wrap = false
vim.opt.linebreak = true -- Wrap lines at convenient points

-- completion
vim.opt.completeopt = "menuone,noselect"

-- 24-bit color
vim.opt.termguicolors = true

-- sign column
vim.opt.signcolumn = "yes"

-- splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
