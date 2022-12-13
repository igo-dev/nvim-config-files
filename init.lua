local g = vim.g
local wo = vim.wo
local bo = vim.bo
local o = vim.o
local map = vim.api.nvim_set_keymap
local set = vim.opt
local cmd = vim.cmd

map("n", "<C-c>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-\\>", ":CodeActionMenu<CR>", { silent = true })
map("n", "<C-[>", "<cmd>po<CR>", { noremap = true, silent = true })
--map("i", "<TAB>", "<CR>", { noremap = true, silent = true })
--map("i", "<S-TAB>", "<C-p>", { noremap = true, silent = true })
cmd("colorscheme oxocarbon")

vim.opt.background = "dark"
set.pumheight = 10
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true

require('packer')
require('nvim-tree')
require('nvim-treesitter')
require('cmp')
require('indent_blankline')
require('lualine')
require('cmake')
require('mason')
require('mason-lspconfig')
require'lspconfig'.clangd.setup{}
require('plugins')
