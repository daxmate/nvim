return {
	{ "junegunn/fzf" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local fzf = require("fzf-lua")
			fzf.setup({
				winopts = {
					height = 0.9,
					width = 0.8,
					preview = { layout = "vertical" },
				},
				fzf_colors = {
					true,
				},
			})
			-- 快捷键
			vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
		end,
	},
	{ "is0n/fm-nvim" },
}
