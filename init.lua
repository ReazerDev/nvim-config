vim.g.mapleader = ","

require('plugins')
require('lualine_bubbles')
require('mini_config')
require('telescope_config')
require('package-info').setup({
  package_manager = 'npm',
  autostart = true,
  hide_up_to_date = true
})
local harpoon = require('harpoon')
harpoon:setup({})
require('keybinds')

local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set(
  'n',
  '<C-e>',
  function() toggle_telescope(harpoon:list()) end,
  { desc = 'Open harpoon window' }
)

vim.cmd.colorscheme "catppuccin-mocha"

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.mouse = 'r'
vim.opt.number = true

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.api.nvim_create_user_command('Prettier', ':CocCommand prettier.forceFormatDocument', { nargs = 0 })
