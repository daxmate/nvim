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
		"vim-airline/vim-airline",
		dependencies = { "vim-airline/vim-airline-themes" },
		lazy = false,
		priority = 1000,
		init = function()
			vim.g.airline_powerline_fonts = 1
			vim.g["airline#extensions#tabline#enabled"] = 1
			vim.g["airline#extensions#tabline#formatter"] = "short_path_improved"
		end,
	},
}
