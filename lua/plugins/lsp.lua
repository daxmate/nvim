-- ~/.config/nvim/lua/plugins/lsp.lua
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "Lua" },
						diagnostics = {
							globals = {
								"vim",
								"string",
								"table",
								"require",
								"Candidate",
								"yield",
								"local",
								"tex",
								"hs",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			-- Vim
			lspconfig.vimls.setup({
				diagnostic = { enable = true },
				indexes = {
					count = 3,
					gap = 100,
					projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
					runtimepath = true,
				},
				isNeovim = true,
				iskeyword = "@,48-57,_,192-255,-#",
				runtimepath = "",
				suggest = { fromRuntimepath = true, fromVimruntime = true },
				vimruntime = "",
			})

			-- C/C++
			lspconfig.clangd.setup({})

			-- Python
			lspconfig.pyright.setup({})

			-- TeX
			-- lspconfig.ltex.setup {}
			-- lspconfig.texlab.setup {}
			lspconfig.digestif.setup({})

			-- CMake
			lspconfig.cmake.setup({})
		end,
	},
}
