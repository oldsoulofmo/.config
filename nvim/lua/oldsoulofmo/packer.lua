-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

     -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope.nvim (requires plenary.nvim)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Treesitter Playground
  use 'nvim-treesitter/playground'

  -- Gruvbox Material Colorscheme
  use 'sainnhe/gruvbox-material'

  -- LSP Zero
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  }


    use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },
    },
}


require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true, -- Enable Tree-sitter syntax highlighting
  },
  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes under cursor (default: 25ms)
    persist_queries = false, -- Whether queries should persist across sessions
  },
        vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })

})


   use {
    'lervag/vimtex',
    config = function()
        vim.cmd('filetype plugin indent on')
        vim.cmd('syntax enable')
    end
}

  use { "mfussenegger/nvim-jdtls"}


-- Treesitter configuration
require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "cpp","c_sharp", "python", "lua", "javascript", "html", "css" }, -- Languages you want
  highlight = {
    enable = true, -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false, -- Set to true if you want to use Vim’s syntax highlighting alongside
  },
  indent = {
    enable = true -- Enable Treesitter-based indentation
  },
})

end)
