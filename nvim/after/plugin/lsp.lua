-- ~/.config/nvim/lua/lsp.lua
local lsp = require('lsp-zero')

-- 1) define your on_attach keymaps exactly once
lsp.on_attach(function(client, bufnr)
  local km = vim.keymap.set
  local opts = { buffer = bufnr, remap = false }

  km('n', 'gd', vim.lsp.buf.definition, opts)
  km('n', 'K',  vim.lsp.buf.hover,      opts)
  km('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
  km('n', '<leader>vd',  vim.diagnostic.open_float,     opts)
  km('n', '[d', vim.diagnostic.goto_next,  opts)
  km('n', ']d', vim.diagnostic.goto_prev,  opts)
  km('n', '<leader>vca', vim.lsp.buf.code_action, opts)
  km('n', '<leader>vrr', vim.lsp.buf.references,  opts)
  km('n', '<leader>vrn', vim.lsp.buf.rename,      opts)
  km('i', '<C-h>', vim.lsp.buf.signature_help,    opts)
end)

-- 2) set up mason and mason-lspconfig, using lsp-zero’s default_setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'lua_ls', 'tsserver', 'rust_analyzer' },
  handlers = {
    -- for every server not listed below, lsp-zero will call its default setup
    lsp.default_setup,
    -- custom lua_ls with nvim-lua settings
    lua_ls = function()
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
    end,
  },
})

-- 3) configure nvim-cmp (no lsp-zero presets here either)
local cmp = require('cmp')
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
  },
  formatting = lsp.cmp_format(),
})

