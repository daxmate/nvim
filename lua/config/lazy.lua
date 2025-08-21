-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- require("lazy").setup({
-- 	{"wbthomason/packer.nvim"}, -- The packer manager itself
-- 	{"nvim-lua/plenary.nvim"}, -- a common plugin used by many other plugins

-- 	{"nanotee/zoxide.vim"}, -- use zoxide in vim

-- 	{"Pocco81/auto-save.nvim"}, -- auto save

--     -- themes and appearance
-- 	{"NLKNguyen/papercolor-theme"},
-- 	{"vim-airline/vim-airline"},
-- 	{"vim-airline/vim-airline-themes"},
-- 	{"famiu/bufdelete.nvim"}, -- keep window layout while deleting buffer
--     -- use "HiPhish/rainbow-delimiters.nvim"
-- 	{"luochen1990/rainbow"},

--     -- use "glepnir/dashboard-nvim" -- pop a dashboard on start
-- 	{"nvim-tree/nvim-web-devicons"},
-- 	{"nvim-tree/nvim-tree.lua"}, -- file explorer

-- 	{"sheerun/vim-polyglot"}, -- syntax highlight
--     -- use "MunifTanjim/nui.nvim"
--     -- use "rcarriga/nvim-notify"
--     -- use "folke/noice.nvim" -- cmdline and message window

--     -- tpope plugins
-- 	{"tpope/vim-fugitive"}, -- with fugitive plugin, airline will display branch symbol, A plugin for Git
-- 	{"tpope/vim-commentary"}, -- comment
-- 	{"tpope/vim-eunuch"}, -- unix shell commands
-- 	{"tpope/vim-surround"}, -- operations on pairs
-- 	{"tpope/vim-repeat"},

-- 	{"windwp/nvim-autopairs"},

--     -- formatter
-- 	{"sbdchd/neoformat"},

-- 	{"easymotion/vim-easymotion"}, -- easymotion

--     -- plugin for tex
-- 	{"lervag/vimtex"},

--     -- completion and lsp
-- 	{"neovim/nvim-lspconfig"},
-- 	{"hrsh7th/cmp-nvim-lsp"},
-- 	{"williamboman/mason.nvim"},
-- 	{"hrsh7th/nvim-cmp"},
-- 	{"hrsh7th/cmp-buffer"},
-- 	{"hrsh7th/cmp-path"},
-- 	{"hrsh7th/cmp-omni"},
-- 	{"hrsh7th/cmp-cmdline"},
-- 	{"hrsh7th/cmp-nvim-lua"},

-- 	{"SirVer/ultisnips"}, -- ultisnips
-- 	{"quangnguyen30192/cmp-nvim-ultisnips"}, -- nvim-cmp support

-- 	{"L3MON4D3/LuaSnip"},
--     use "saadparwaiz1/cmp_luasnip"
-- 	{"rafamadriz/friendly-snippets"}, -- provide so many snippets

--     -- telescope fuzzy info finder
-- 	{"nvim-telescope/telescope.nvim"},
-- 	{"nvim-telescope/telescope-live-grep-args.nvim"},

--     -- treesitter
-- 	{"nvim-treesitter/nvim-treesitter"},
--     use({
--         "nvim-treesitter/nvim-treesitter-textobjects",
--         after = "nvim-treesitter",
--         requires = "nvim-treesitter/nvim-treesitter"
--     })
-- 	{"jessekelighine/vim-SimpleColorsLatex"},

--     -- fzf
-- 	{"junegunn/fzf"},
-- 	{"ibhagwan/fzf-lua"},
-- 	{"is0n/fm-nvim"},

--     -- programming
-- 	{"preservim/tagbar"}, -- tagbar
-- 	{"cdelledonne/vim-cmake"}, -- cmake
-- 	{"akinsho/toggleterm.nvim"}, -- terminal
-- 	{"lewis6991/gitsigns.nvim"},
-- 	{"gauteh/vim-cppman"},

--     -- debug
-- 	{"mfussenegger/nvim-dap"},
--     use {
--         "rcarriga/nvim-dap-ui",
--         requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
--     }
-- 	{"folke/neodev.nvim"},
-- 	{"nvim-telescope/telescope-dap.nvim"},
-- 	{"theHamsta/nvim-dap-virtual-text"},

--     -- tabby
--     -- use "TabbyML/vim-tabby"

--     -- markdown preview
-- 	{"iamcco/markdown-preview.nvim"},

--     -- ime switch
-- 	{"keaising/im-select.nvim"},

-- })
