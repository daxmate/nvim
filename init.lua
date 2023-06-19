require("plugins")
require("keymaps")
require("options")
require("autocommands")

vim.cmd([[
augroup autosource
    autocmd!
    autocmd BufWritePost <buffer> % luafile %
augroup end
]])
