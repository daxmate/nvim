return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "astyle" },
				cmake = { "cmake_format" },
				zsh = { "shfmt" },
				python = { "black" },
				json = {"jq"},
			},
			formatters = {
				astyle = {
					command = "astyle",
					args = {
						"--style=allman",
						"--indent=tab=4",
						"--pad-comma",
						"--pad-oper",
						"--unpad-paren",
						"--break-blocks",
						"--squeeze-lines=1",
						"--align-method-colon",
						"--max-code-length=120",
						"--break-after-logical",
						"--indent-classes",
						"--indent-switches",
						"--indent-namespaces",
						"--indent-modifiers",
						"--align-pointer=type",
					},
				},
				cmake_format = {
					command = "cmake-format",
					args = { "-" },
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "never",
			},
		})
	end,
}
