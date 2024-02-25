local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')
lazy.setup({
  { 'tpope/vim-surround',   event = 'InsertEnter' },
  { 'tpope/vim-repeat',     event = 'InsertEnter' },
  { 'tpope/vim-unimpaired', event = 'InsertEnter' },
  { 'tpope/vim-commentary', event = 'InsertEnter' },
  { 'tpope/vim-abolish' },
  'nelstrom/vim-visual-star-search',
  'nvim-lua/plenary.nvim',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  'fisadev/vim-isort',
  { 'Shougo/vimproc.vim',      run = 'make' },
  {
    "github/copilot.vim",
    lazy = false,
  },
  'ThePrimeagen/harpoon',
  { 'folke/which-key.nvim',  opts = {},  lazy = true },
  { 'numToStr/Comment.nvim', opts = {},  event = "InsertEnter", },

  -- git related
  { 'tpope/vim-fugitive', },
  { 'tpope/vim-rhubarb',     lazy = true },
  { 'tpope/vim-sleuth',      lazy = true },
  'lewis6991/gitsigns.nvim',
  'ThePrimeagen/git-worktree.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      { 'j-hui/fidget.nvim', opts = {} },
      'folke/neodev.nvim',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
      vim.cmd [[ hi Visual guibg=grey ]]
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  { 'MunifTanjim/prettier.nvim' },
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
  },
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
  },
  { "bronson/vim-trailing-whitespace" },
  { "prettier/vim-prettier" },
  { "akinsho/toggleterm.nvim" },
})
