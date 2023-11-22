vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/playground' }

  -- use { 'onsails/lspkind.nvim' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'b3nj5m1n/kommentary' }

  use { 'ThePrimeagen/harpoon' }
  use { 'mbbill/undotree' }

  use { 'tpope/vim-fugitive' }
  use { 'lewis6991/gitsigns.nvim' }

  -- TODO: check if I really need all these from tpope
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-rhubarb' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-obsession' }
  use { 'tpope/vim-dotenv' }
  -- use { 'tpope/vim-dadbod' }

  --[[ use {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  } ]]

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use { 'github/copilot.vim' }
  -- use { 'David-Kunz/gen.nvim' }
  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup()
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })
  use({
    "huynle/ogpt.nvim",
      config = function()
        require("ogpt").setup()
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
  })

  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }

  use { 'editorconfig/editorconfig-vim' }

  use { 'preservim/vim-markdown' }

  --[[ use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  }) ]]

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- colorscheme
  -- use { 'rmehri01/onenord.nvim' }
  use { "catppuccin/nvim", as = "catppuccin" }

  -- lab
  -- use "$HOME/src/lab/querymebig.nvim"
  use "$HOME/src/clones/vim-dadbod"

end)
