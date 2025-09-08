-- 安装 (lazy.nvim)
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- 配置选项
		cmdline = {
			view = "cmdline_popup", -- 在弹出框中显示命令
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
			},
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
