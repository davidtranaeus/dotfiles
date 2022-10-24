vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    use {
      "projekt0n/github-nvim-theme",
      config = function()
        require("github-theme").setup({
          theme_style = "dark"
        })
      end
    }

    use {
      "williamboman/mason.nvim",
      config = function() require("mason").setup() end
    }

    use "neovim/nvim-lspconfig"
    use "jose-elias-alvarez/null-ls.nvim"
    use "nvim-lua/plenary.nvim"

    use {
      "nvim-treesitter/nvim-treesitter",
      run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    }
    use "lewis6991/gitsigns.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"


    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.0",
      requires = { {"nvim-lua/plenary.nvim"} },
    }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }
end)
