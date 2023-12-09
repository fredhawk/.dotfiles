local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  -- Lua
  {
    "folke/twilight.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  -- Undootreee
  'mbbill/undotree',

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    -- build = function()
    --   pcall(require('nvim-treesitter.install').update { with_sync = true })
    -- end,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },

  'windwp/nvim-ts-autotag',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  'folke/tokyonight.nvim',
  -- 'navarasu/onedark.nvim' -- Theme inspired by Atom,
  'nvim-lualine/lualine.nvim', -- Fancier statusline,
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { } }, -- Add indentation guides even on blank lines,
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines,
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically,

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',            branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',   cond = vim.fn.executable 'make' == 1 },
  'christoomey/vim-tmux-navigator',

  -- Dap setup
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  { "rcarriga/nvim-dap-ui",      dependencies = { "mfussenegger/nvim-dap" } },
  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
  {
    "microsoft/vscode-js-debug",
    lazy = true,
    build = "npm install --legacy-peer-deps && npm run compile"
  },
})
