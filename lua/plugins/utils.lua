return {
	-- tpope plugins
	"tpope/vim-fugitive", -- with fugitive plugin, airline will display branch symbol, A plugin for Git
	"tpope/vim-commentary", -- comment
	"tpope/vim-eunuch", -- unix shell commands
	"tpope/vim-surround", -- operations on pairs
	"tpope/vim-repeat",
	"sbdchd/neoformat",
	"easymotion/vim-easymotion", -- easymotion
	{
		"nanotee/zoxide.vim", -- use zoxide in vim
		config = function()
			vim.api.nvim_create_user_command("J", function()
				vim.cmd("Z")
			end, {})
			vim.api.nvim_create_user_command("Ji", function()
				vim.cmd("Zi")
			end, {})
		end,
	},
	"SirVer/ultisnips", -- ultisnips
	{
		"nvim-tree/nvim-tree.lua", -- file explorer
		config = function()
			-- 禁用 netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup()
		end,
	},
	"nvim-tree/nvim-web-devicons",
	"famiu/bufdelete.nvim",
}
