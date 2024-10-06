require "nvchad.mappings"

local noremap = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
noremap('n', 'J', '10jzz')
noremap('n', 'K', '10kzz')
noremap('n', 'n', 'nzz')
noremap('n', 'N', 'Nzz')
noremap('n', 'd', '"_d')
noremap('n', 'dd', '"_dd')
noremap('v', 'p', '"0p')
noremap('i', '<C-x>', '<C-e>')

local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end
map('n', 'ss', ':w<CR>')
map('n', 'QQ', ':q<CR>')

local vimmap = vim.keymap.set
vimmap("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

vimmap("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
