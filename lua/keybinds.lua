vim.keymap.set('n', '<leader>a', ':BufferPrevious<CR>')
vim.keymap.set('n', '<leader>d', ':BufferNext<CR>')
vim.keymap.set('n', '.a', ':BufferMovePrevious<CR>')
vim.keymap.set('n', '.d', ':BufferMoveNext<CR>')
vim.keymap.set('n', '<leader>s', ':BufferClose<CR>')
vim.keymap.set('n', '<leader>q', ':BufferClose!<CR>')
vim.keymap.set('n', '<leader>1', ':BufferGoto 1<CR>')
vim.keymap.set('n', '<leader>2', ':BufferGoto 2<CR>')
vim.keymap.set('n', '<leader>3', ':BufferGoto 3<CR>')
vim.keymap.set('n', '<leader>4', ':BufferGoto 4<CR>')
vim.keymap.set('n', '<leader>5', ':BufferGoto 5<CR>')
vim.keymap.set('n', '<leader>6', ':BufferGoto 6<CR>')
vim.keymap.set('n', '<leader>7', ':BufferGoto 7<CR>')
vim.keymap.set('n', '<leader>8', ':BufferGoto 8<CR>')
vim.keymap.set('n', '<leader>9', ':BufferGoto 9<CR>')

vim.keymap.set('n', '<leader>p', ':Telescope find_files hidden_files=true<CR>')
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<CR>')

vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
vim.keymap.set('n', '.', '<Nop>')

vim.api.nvim_set_keymap(
  'n',
  '<leader>ns',
  "<cmd>lua require('package-info').show({ force = true })<cr>",
  { silent = true, noremap = true }
)
