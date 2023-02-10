local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	-- use "numToStr/Comment.nvim"
	-- use "JoosepAlviste/nvim-ts-context-commentstring"
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	-- use "ryanoasis/vim-devicons"
	-- use "scrooloose/nerdtree"
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	-- use "ahmedkhalf/project.nvim"
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("tpope/vim-commentary")
	-- use({
	--   'crispgm/nvim-tabline',
	--   config = function()
	--       require('tabline').setup({})
	--   end,
	-- })
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("gpanders/editorconfig.nvim")

	-- Colorschemes
	use("RRethy/nvim-base16")
	use("folke/lsp-colors.nvim")

	-- Cmp
	use("hrsh7th/nvim-cmp") -- The completion plugin
	-- use "hrsh7th/cmp-buffer" -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("RRethy/vim-illuminate")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")

	-- Git
	use("tpope/vim-fugitive")
	use("airblade/vim-gitgutter")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
