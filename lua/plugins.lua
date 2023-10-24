vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'folke/tokyonight.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'romgrk/barbar.nvim', requires = 'nvim-tree/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { 'echasnovski/mini.nvim', branch = 'stable' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'utilyre/barbecue.nvim', tag = '*',
    requires = { 'SmiteshP/nvim-navic', 'nvim-tree/nvim-web-devicons' },
    after = 'nvim-web-devicons',
    config = function()
      require("barbecue").setup({
        symbols = {
          separator = '>'
        }
      })
    end
  }
  use({
    'vuki656/package-info.nvim',
    requires = 'MunifTanjim/nui.nvim'
  })
end)

