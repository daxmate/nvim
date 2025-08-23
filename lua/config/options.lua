-- lua/config/options.lua
local opt = vim.opt
local g = vim.g

-- 基本选项
local options = {
	background = "light", -- light background color
	number = true, -- 显示行号
	textwidth = 120,
	colorcolumn = "+1",
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
}

for k, v in pairs(options) do
	opt[k] = v
end

-- maplocalleader
g.maplocalleader = "," -- 设置 vimtex 插件的 maplocalleader
g.mapleader = ","

-- 文件类型和缩进
vim.cmd("filetype plugin indent on")

-- 高亮 EndOfBuffer（原 VimR 判断）
if not g.gui_vimr then
	vim.cmd("highlight EndOfBuffer ctermfg=bg")
end
