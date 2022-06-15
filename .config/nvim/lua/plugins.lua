local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PackerBootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("EdenEast/nightfox.nvim")
	use("christoomey/vim-tmux-navigator")
	use("nvim-lua/plenary.nvim")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("AndrewRadev/splitjoin.vim")
	use("bronson/vim-trailing-whitespace")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")

	use({
		"kyazdani42/nvim-tree.lua",
	})

	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")

	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	use("rafamadriz/friendly-snippets")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use("folke/trouble.nvim")

	use("nvim-lualine/lualine.nvim")

	use("windwp/nvim-autopairs")

	use("simrat39/rust-tools.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("folke/which-key.nvim")

	use({
		"benfowler/telescope-luasnip.nvim",
		module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	})

	use({
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	})

	if PackerBootstrap then
		require("packer").sync()
	end
end)
