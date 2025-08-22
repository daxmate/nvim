-- lua/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "lua", "cpp", "vim", "markdown" },
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
