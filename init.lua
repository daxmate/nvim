vim.g.python3_host_prog = "/Users/dax/.virtualenvs/pynvim/bin/python3"
vim.cmd("let g:loaded_node_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")

require("config.lazy")

-- 加载其他配置文件
require("config.options") -- 编辑器选项设置
require("config.functions") -- 自定义函数j
require("config.keymaps") -- 快捷键映射
require("config.autocmd") -- 自动命令

-- 设置GitSigns的配色
vim.cmd([[highlight GitSignsAdd guifg=#4d783f]])
vim.cmd([[highlight GitSignsDelete guifg=#79323d]])
vim.cmd([[highlight GitSignsChange guifg=#9c9d0d]])
