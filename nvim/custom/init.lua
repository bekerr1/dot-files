local nnoremap = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end

nnoremap('n', 'J', '10jzz')
nnoremap('n', 'K', '10kzz')
nnoremap('n', 'n', 'nzz')
nnoremap('n', 'N', 'Nzz')

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


