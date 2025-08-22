return {
	"windwp/nvim-autopairs",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		npairs.setup({
			enable_bracket_in_quote = true, -- 确保括号可以在 $...$ 中配对
		})

		-- 添加 $ 的配对规则
		npairs.add_rule(
			Rule("$", "$", "tex")
				:with_pair(function(opts)
					local line = opts.line
					local col = opts.col

					local before_cursor = line:sub(1, col - 1)
					local after_cursor = line:sub(col)

					local count_before = #before_cursor:gsub("[^$]", "")
					local count_after = #after_cursor:gsub("[^$]", "")

					-- 如果光标前后都有偶数个 $，说明不在 $ 环境内，允许生成 $
					return count_before % 2 == 0 and count_after % 2 == 0
				end)
				:with_move(cond.after_text("$")) -- 跳出到右侧 $
				:with_del(cond.not_before_text("$")) -- 删除时避免干扰
		)

		-- 基础括号规则
		npairs.add_rules({
			Rule("(", ")"),
			Rule("{", "}"),
			Rule("[", "]"),
		})
	end,
}
