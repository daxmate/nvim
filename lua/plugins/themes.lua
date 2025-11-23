return {
	{
		"NLKNguyen/papercolor-theme",
		lazy = false,
		priority = 1000,
		config = function()
			-- 主题和 airline
			vim.cmd.colorscheme("PaperColor")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "papercolor",
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
