vim.g.mapleader = ","

require('plugins')
require('lualine_bubbles')
require('keybinds')
require('mini_config')
require('telescope_config')
require('package-info').setup({
  package_manager = 'npm',
  autostart = true,
  hide_up_to_date = true
})

vim.cmd[[colorscheme tokyonight-night]]

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = r
vim.opt.number = true

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.api.nvim_create_user_command('Prettier', ':CocCommand prettier.forceFormatDocument', { nargs = 0 })
