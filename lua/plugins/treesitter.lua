require("nvim-treesitter.configs").setup {
    ensure_installed = {"python", "lua", "cpp", "vim", "markdown"},
    highlight = {enable = true, additional_vim_regex_highlighting = false},
    indent = {enable = true}
}

