local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	use("bluz71/vim-nightfly-guicolors") -- colorscheme

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer") -- maximizing and restoring current views

	-- essentials
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- commenting
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- dev-icons
	use("kyazdani42/nvim-web-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzyfinding
    use("junegunn/fzf")
    use("nvim-telescope/telescope-fzf-native.nvim")
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
    use("dimaportenko/telescope-simulators.nvim")
    use("folke/todo-comments.nvim")

	-- show buffers at top
	use("romgrk/barbar.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
    use("honza/vim-snippets")

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- programming language plugins
	use("simrat39/rust-tools.nvim")
    use({
        "gbprod/phpactor.nvim",
        run = require('phpactor.handler.update'),
    })

    -- Debug Adapter Protocol
    use("ravenxrz/DAPInstall.nvim")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    use("mfussenegger/nvim-dap-python")
    use("nvim-telescope/telescope-dap.nvim")
    use({"jbyuki/one-small-step-for-vimkind", module = "osv" })
    use({
        "mfussenegger/nvim-dap",
        opt = true,
        event = "BufReadPre",
        module = { "dap" },
        config = function ()
            require('jannik.plugins.dap').setup()
        end
    })

	-- linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use("ntpeters/vim-better-whitespace")

    use("xiyaowong/nvim-transparent")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- git integration
	use("tpope/vim-fugitive")
	use("airblade/vim-gitgutter")
    use("sindrets/diffview.nvim")

	-- motions
	use("easymotion/vim-easymotion")
    use("ludovicchabant/vim-gutentags")

    -- latex and writing
    use("lervag/vimtex")

    -- note taking
    use("vimwiki/vimwiki")
    use("ellisonleao/glow.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
