local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'

  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons" ,
    wants = "nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()

      require("nvim-tree").setup {
        hijack_cursor = true,
        view = {
          width = 40
        }
      }
    end
  }

  use 'vim-autoformat/vim-autoformat'

  use 'nyoom-engineering/oxocarbon.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "cmake", "cpp", "bash" },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_hightlighting = true,
        },
        indent = { enable = true },
      }
    end
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('indent_blankline').setup {
        space_char_blankline = " ",
      }

    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  use {
    'Shatur/neovim-cmake',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  --> lsp
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.clangd.setup{}
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('cmp').setup {

        sources = {
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "buffer" },
        }
      }
    end
  }

  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'

  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

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

vim.opt.background = "dark"
set.pumheight = 10
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true
vim.opt.list = true
--vim.opt.listchars:append "space:."
--vim.opt.listchars:append "eol:â´"
cmd("colorscheme oxocarbon")

end)
