-- return {
-- 	"stevearc/conform.nvim",
-- 	config = function()
-- 		require("conform").setup({
-- 			formatters_by_ft = {
-- 				lua = { "stylua" },
-- 				cpp = { "astyle" },
-- 				cmake = { "cmake_format" },
-- 				zsh = { "shfmt" },
-- 				python = { "black" },
-- 				json = { "jq" },
-- 				tex = { "latexindent" },
-- 			},
-- 			formatters = {
-- 				astyle = {
-- 					command = "astyle",
-- 					args = {
-- 						"--style=allman",
-- 						"--indent=tab=4",
-- 						"--pad-comma",
-- 						"--pad-oper",
-- 						"--unpad-paren",
-- 						"--break-blocks",
-- 						"--squeeze-lines=1",
-- 						"--align-method-colon",
-- 						"--max-code-length=120",
-- 						"--break-after-logical",
-- 						"--indent-classes",
-- 						"--indent-switches",
-- 						"--indent-namespaces",
-- 						"--indent-modifiers",
-- 						"--align-pointer=type",
-- 					},
-- 				},
-- 				latexindent = {
-- 					command = "latexindent",
-- 					args = {
-- 						"-r",
-- 						"-m",
-- 						"--GCString",
-- 						"-l=/Users/dax/.mylatexindent.yaml",
-- 						"-",
-- 					},
-- 					stdin = true,
-- 				},
-- 				cmake_format = {
-- 					command = "cmake-format",
-- 					args = { "-" },
-- 				},
-- 			},
-- 			format_on_save = {
-- 				-- These options will be passed to conform.format()
-- 				timeout_ms = 500,
-- 				lsp_format = "never",
-- 			},
-- 		})
-- 	end,
-- }

return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},

				tex = {
					function()
						return {
							exe = "latexindent",
							args = {
								"-r",
								"-m",
								"--GCString",
								"-l=/Users/dax/.mylatexindent.yaml",
								"-",
							},
							stdin = true,
						}
					end,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
					-- Remove trailing whitespace without 'sed'
					-- require("formatter.filetypes.any").substitute_trailing_whitespace,
				},
			},
		})
	end,
}
