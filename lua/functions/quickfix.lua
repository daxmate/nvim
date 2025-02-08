local group = vim.api.nvim_create_augroup("quickfix_mapping", { clear = true })

local function return_to_normal()
	local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
	vim.api.nvim_feedkeys(keys, "n", true)
end

-- 按下dd删除一行
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	group = group,
	callback = function(ev)
		vim.keymap.set("n", "dd", function()
			local qflist = vim.fn.getqflist()
			local line = vim.fn.line(".")
			table.remove(qflist, line)
			vim.fn.setqflist(qflist)
		end, { buffer = ev.buf })
	end,
})

-- 按下v后进行多选模式，然后按d删除
-- TODO 修正这个函数，目前就只用上面的dd命令
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "qf",
	callback = function(ev)
		vim.keymap.set("v", "d", function()
			local qflist = vim.fn.getqflist()
			local new_qflist = {}
			local start_line = vim.fn.line("'<")
			local end_line = vim.fn.line("'>")

			if start_line > end_line then
				start_line, end_line = end_line, start_line
			end
			for index, value in ipairs(qflist) do
				if index < start_line or index > end_line then
					table.insert(new_qflist, value)
				end
			end
			vim.fn.setqflist(new_qflist, "r")
			return_to_normal()
		end, { buffer = ev.buf })
	end,
})
