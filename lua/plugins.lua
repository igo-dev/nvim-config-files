vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

return require('packer').startup(function(use)

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

  use {'nyoom-engineering/oxocarbon.nvim'}

	use {
		'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "cpp", "java", "bash" },
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
    show_current_context = true,
    show_current_context_start = true,

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

use 'neovim/nvim-lspconfig'
use 'hrsh7th/nvim-cmp'

use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu'
  }

end)
