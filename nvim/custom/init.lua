local noremap = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

-- movement
noremap('n', 'J', '10jzz')
noremap('n', 'K', '10kzz')
noremap('n', 'n', 'nzz')
noremap('n', 'N', 'Nzz')

noremap('n', 'd', '"_d')
noremap('n', 'dd', '"_dd')

---- copy/paste registers
-- This doesnt seem to work well
--noremap('n', 'y', '"*y')
--noremap('n', 'Y', '"*Y')
--noremap('n', 'p', '"*p')
--noremap('n', 'P', '"*P')
--
--noremap('v', 'y', '"*y')
--noremap('v', 'Y', '"*Y')
--noremap('v', 'p', '"*p')
--noremap('v', 'P', '"*P')

local map = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { silent = true })
end

map('n', 'H', ':bprev<CR>')
map('n', 'L', ':bnext<CR>')
map('n', 'ss', ':w<CR>')
map('n', 'QQ', ':q<CR>')


vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.go",
  command = "setlocal noet ts=4 sw=4 sts=4"
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.sh",
  command = "setlocal expandtab ts=4 sw=4 sts=4"
})


