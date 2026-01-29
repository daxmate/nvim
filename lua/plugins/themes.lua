return {
	{
		"pappasam/papercolor-theme-slim",
		lazy = false,
		priority = 1000,
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "solarized-osaka",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
				},
				tabline = {
					lualine_a = {
						{
							"buffers",
						},
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "hostname" },
				},
			})
		end,
	},
}
