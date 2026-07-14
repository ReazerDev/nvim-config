vim.g.mapleader = ","

require('vim._core.ui2').enable()

require('plugins')
require('lualine_bubbles')
require('mini_config')
require('telescope_config')
require('autocompletion')
require('lsp')
require('dap_config')
require('barbecue').setup({
    symbols = {
        separator = '>'
    },
    attach_navic = false
})
require("dressing").setup({
  input = {
    border = "rounded",
  }
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
vim.opt.fileformats = { "dos" }
vim.opt.updatetime = 300

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})