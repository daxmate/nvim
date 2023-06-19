local opt = vim.opt
local g = vim.g

local options = {
    background = "light", -- light background color
    number = true, -- display line number, relativenumber or rnu also available
    textwidth = 120,
    colorcolumn = "+1"
}

for k, v in pairs(options) do opt[k] = v end
vim.cmd("let maplocalleader = ','") -- set maplocalleader for vimtex plugin

------------------------------------------------------------------------------------------------------------------------
-- airline and colorscheme
vim.cmd.colorscheme("PaperColor")
g.airline_powerline_fonts = 1 -- switch on powerline fonts in airline status bar
g["airline#extensions#tabline#enabled"] = 1 -- endable tabline
g["airline#extensions#tabline#formatter"] = "short_path_improved" -- display only filename in status bar
------------------------------------------------------------------------------------------------------------------------

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- filetype issue handler
vim.cmd("filetype plugin indent on")

-- autosource
vim.cmd([[
augroup autosource
    autocmd!
    autocmd BufWritePost,BufEnter <buffer> % luafile %
augroup end
]])

-- hide tilde symbol beyond end of buffer
vim.cmd("highlight EndOfBuffer ctermfg=bg")

-- set vimtex build dir
vim.cmd("let vimtex_compiler_latexmk = {'out_dir': 'build'}")
-- tex viewer
vim.g.vimtex_view_method = "sioyek"

-- export compile commands for c++
vim.g.cmake_link_compile_commands = 1

vim.cmd("let g:cmake_build_dir_location = expand('%:h') . '/build'")
vim.cmd("let $GTEST_COLOR = 1")

