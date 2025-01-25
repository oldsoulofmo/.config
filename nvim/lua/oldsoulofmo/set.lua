vim.opt.guicursor = ""
vim.g.gruvbox_material_background = 'hard' -- Options: 'hard', 'medium', 'soft'
vim.g.gruvbox_material_foreground = 'material' -- Options: 'material', 'mix', 'original'

vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Packer setup
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'lervag/vimtex'
end)

