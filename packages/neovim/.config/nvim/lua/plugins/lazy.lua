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
  { 'tpope/vim-repeat',                event = 'InsertEnter' },
  { 'tpope/vim-unimpaired',            event = 'InsertEnter' },
  { 'tpope/vim-abolish' },
  { 'nelstrom/vim-visual-star-search', },
  'nvim-lua/plenary.nvim',
  { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'numToStr/Comment.nvim',   lazy = false },
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
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
  { 'Shougo/vimproc.vim',                  run = 'make' },
  {
    "github/copilot.vim",
    lazy = false,
  },
  { 'ThePrimeagen/harpoon' },
  { 'folke/which-key.nvim',  opts = {}, },
  { 'numToStr/Comment.nvim', opts = {}, event = "InsertEnter", },

  -- git related
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb', },
  { 'tpope/vim-sleuth', },
  'lewis6991/gitsigns.nvim',
  'ThePrimeagen/git-worktree.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
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
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'InsertEnter',
    main = 'ibl',
    opts = {},
  },
  { 'navarasu/onedark.nvim' },
  { 'windwp/nvim-ts-autotag' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
  { 'MunifTanjim/prettier.nvim' },
  {
    'mfussenegger/nvim-dap',
    event = 'InsertEnter',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
  },
  {
    "nvim-neotest/neotest",
    event = "InsertEnter",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
  },
  { "bronson/vim-trailing-whitespace", event = 'InsertEnter' },
  { "prettier/vim-prettier" },
  { 'akinsho/toggleterm.nvim',         version = "*",        config = true },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  { "mbbill/undotree",            event = 'InsertEnter' },
  { "sindrets/diffview.nvim", },
  { "norcalli/nvim-colorizer.lua" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    opts = {
      debug = true,
    },
  },
  { 'mhartington/formatter.nvim' },
})
