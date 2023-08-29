local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use("wbthomason/packer.nvim")
  -- themes secction
  -- use({
  -- 	"svrana/neosolarized.nvim",
  -- 	requires = { "tjdevries/colorbuddy.nvim" },
  -- })
  -- use("folke/tokyonight.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("tribela/vim-transparent")
  -- use("RRethy/nvim-base16")
  use("tjdevries/colorbuddy.nvim")
  use("marko-cerovac/material.nvim")
  -- Other plugin
  use("nvim-lualine/lualine.nvim")       -- Statusline
  use("nvim-lua/plenary.nvim")           -- Common utilities
  use("neovim/nvim-lspconfig")           -- LSP
  use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use({ -- CMP completion engine
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind-nvim",     -- Icons on the popups -- vscode-like pictograms
      "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",       -- nvim-cmp source for buffer words
      "saadparwaiz1/cmp_luasnip", -- Snippets source
      "L3MON4D3/LuaSnip",         -- Snippet engine
    },
    run = function()
      require("/home/soporte/.config/nvim/plugin/cmp.lua")
    end,
  })
  use("glepnir/lspsaga.nvim") -- LSP UIs
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use("kyazdani42/nvim-web-devicons") -- File icons
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-file-browser.nvim")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use({
    "numToStr/Comment.nvim",
    requires = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  })
  use("norcalli/nvim-colorizer.lua")
  use("folke/zen-mode.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })
  use("akinsho/nvim-bufferline.lua")
  -- use 'github/copilot.vim'

  use("lewis6991/gitsigns.nvim")
  use("dinhhuy258/git.nvim") -- For git blame & browse
end)
