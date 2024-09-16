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
  { 'nelstrom/vim-visual-star-search', event = 'InsertEnter' },
  'nvim-lua/plenary.nvim',
  { 'akinsho/bufferline.nvim', version = "*",                      dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'numToStr/Comment.nvim',   event = { "BufRead", "BufNewFile" } },
  {
    "kylechui/nvim-surround",
    event = { "BufRead", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",                       opts = {}, event = { "BufRead", "BufNewFile" } },
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
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  { 'fisadev/vim-isort',                   event = { "BufRead", "BufNewFile" } },
  { 'Shougo/vimproc.vim',                  run = 'make' },
  {
    -- "github/copilot.vim",
    -- event = { "BufRead", "BufNewFile" },
  },
  { 'ThePrimeagen/harpoon' },
  { 'folke/which-key.nvim',    opts = {} },
  { 'numToStr/Comment.nvim',   opts = {},                          event = { "BufRead", "BufNewFile" } },

  -- git related
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb', },
  { 'tpope/vim-sleuth', },
  { 'lewis6991/gitsigns.nvim', event = { "BufRead", "BufNewFile" } },
  'ThePrimeagen/git-worktree.nvim',
  'nvim-lualine/lualine.nvim',
  'nvim-tree/nvim-web-devicons',
  {
    'neovim/nvim-lspconfig',
    event = { "BufRead", "BufNewFile" },
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
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufRead", "BufNewFile" },
    main = 'ibl',
    opts = {},
  },
  { 'navarasu/onedark.nvim' },
  { 'windwp/nvim-ts-autotag', event = 'InsertEnter' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufRead", "BufNewFile" },
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.prettier)
    end,
  },
  { 'MunifTanjim/prettier.nvim',       event = { "BufRead", "BufNewFile" } },
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
    event = { "BufRead", "BufNewFile" },
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
  { "bronson/vim-trailing-whitespace", event = { "BufRead", "BufNewFile" } },
  { "prettier/vim-prettier",           event = { "BufRead", "BufNewFile" } },
  { 'akinsho/toggleterm.nvim',         version = "*",                      config = true },
  { "mbbill/undotree",                 event = { "BufRead", "BufNewFile" } },
  { "sindrets/diffview.nvim",          event = { "BufRead", "BufNewFile" } },
  { "norcalli/nvim-colorizer.lua" },
  {
    -- "CopilotC-Nvim/CopilotChat.nvim",
    -- event = { "BufRead", "BufNewFile" },
    -- branch = "canary",
    -- dependencies = {
    --   { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    --   { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    -- },
    -- opts = {
    --   debug = true,
    -- },
  },
  { 'mhartington/formatter.nvim', event = { "BufRead", "BufNewFile" } },
  'tpope/vim-dadbod',
  'tpope/vim-obsession',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  {
    "vhyrro/luarocks.nvim",
    ft = 'http',
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    event = { "BufRead", "BufNewFile" },
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = { "BufRead", "BufNewFile" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  }
})
