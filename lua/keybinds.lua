vim.keymap.set('n', '<leader>p', ':Telescope find_files hidden_files=true<CR>')
vim.keymap.set('n', '<leader>f', ':Telescope live_grep<CR>')

vim.keymap.set('x', 'p', function() return 'pgv"' .. vim.v.register .. 'y' end, { remap = false, expr = true })
vim.keymap.set('n', '.', '<Nop>')

vim.api.nvim_set_keymap(
  'n',
  '<leader>ns',
  "<cmd>lua require('package-info').show({ force = true })<cr>",
  { silent = true, noremap = true }
)

local harpoon = require('harpoon')

vim.keymap.set('n', '<leader>c', function() harpoon:list():add() end)
vim.keymap.set('n', '<leader>s', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<leader>x', ':bw<CR>')
