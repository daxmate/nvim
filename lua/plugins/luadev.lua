-- lua/plugins/lsp-dev.lua
return {
	{
		"folke/lazydev.nvim", -- neodev.nvim 的继任者
		ft = "lua",
		opts = {
			library = {
				-- 加载 luvit 类型当 `vim.uv` 字符出现时
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- 可选的 `vim.uv` 类型定义
}
