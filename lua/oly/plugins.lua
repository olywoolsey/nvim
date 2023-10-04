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



return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"

    -- Colorschemes
    use "folke/tokyonight.nvim" 
    use "wuelnerdotexe/vim-enfocado" 
    use "rebelot/kanagawa.nvim"
    use "sainnhe/edge"

    -- Makes colours show over text
    use "ap/vim-css-color"

    -- Cmp 
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Status line
    use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

	-- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"

    -- Fuzzy finder
    use "nvim-telescope/telescope.nvim"

    -- Copilot
    use "github/copilot.vim"

    -- Surround
    use "tpope/vim-surround"

    -- Tabs
    use "nanozuki/tabby.nvim"

    -- Tabline
    use "lukas-reineke/indent-blankline.nvim"

    use "Shirk/vim-gas"

    -- Use nvim when editing text in browser
    use "subnut/nvim-ghost.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)