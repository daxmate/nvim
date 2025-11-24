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
				ensure_installed = { "latex", "python", "lua", "cpp", "vim", "markdown", "bash" },
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.treesitter.language.register("bash", "zsh")
		end,
	},
}
