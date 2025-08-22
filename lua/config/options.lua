-- lua/config/options.lua
local opt = vim.opt
local g = vim.g

-- 基本选项
local options = {
	background = "light", -- light background color
	number = true, -- 显示行号
	textwidth = 120,
	colorcolumn = "+1",
}

for k, v in pairs(options) do
	opt[k] = v
end

-- maplocalleader
g.maplocalleader = "," -- 设置 vimtex 插件的 maplocalleader



-- 文件类型和缩进
vim.cmd("filetype plugin indent on")

-- 高亮 EndOfBuffer（原 VimR 判断）
if not g.gui_vimr then
	vim.cmd("highlight EndOfBuffer ctermfg=bg")
end


-- CMake 配置
g.cmake_link_compile_commands = 1
vim.g.cmake_build_dir_location = vim.fn.expand("%:h") .. "/build"
vim.env.GTEST_COLOR = "1"

-- latexindent 配置
g.latexindent_opt = "-m"

-- Neoformat
g.neoformat_try_formatprg = 1

