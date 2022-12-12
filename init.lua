local g = vim.g
local wo = vim.wo
local bo = vim.bo
local o = vim.o
local map = vim.api.nvim_set_keymap
local set = vim.opt -- set options

map("n", "<Enter>", ":nohlsearch<CR>", { silent = true })
map("n", "<C-c>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-\\>", ":CodeActionMenu<CR>", { silent = true })

vim.opt.background = "dark" -- set this to dark or light
vim.cmd("colorscheme oxocarbon")

set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true

-- Requires

require('packer')
require('nvim-tree')
require('nvim-treesitter')
require('indent_blankline')
require('lualine')
--require('nvim-code-action-menu')
require('cmake')
require('mason')
require('mason-lspconfig')
require'lspconfig'.clangd.setup{}
require('plugins')
