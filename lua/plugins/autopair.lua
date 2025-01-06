local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.setup {}

-- 设置 $ 符号的配对规则，并添加跳出功能
npairs.add_rule(Rule("$", "$"):with_move(function()
    local col = vim.fn.col('.')
    local line = vim.fn.line('.')
    local curr_char = vim.fn.getline(line):sub(col, col)
    -- 如果光标后面是 $，按下 $ 就跳出配对
    if curr_char == "$" then return true end
    return false
end))
