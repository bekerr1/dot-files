local cmp = require "cmp"

local options = {
  mapping = {
    ["<C-x>"] = cmp.mapping.close(),
  },
}

options = vim.tbl_deep_extend("force", options, require "nvchad.cmp")
cmp.setup(options)
