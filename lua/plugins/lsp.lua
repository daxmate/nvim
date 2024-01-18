require"lspconfig".lua_ls.setup { -- lua
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "Lua"
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim", "string", "table", "require", "Candidate", "yield",
                    "local", "tex"
                }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false -- THIS IS THE IMPORTANT LINE TO ADD
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}

require"lspconfig".vimls.setup { -- vim
    diagnostic = {enable = true},
    indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = {"runtime", "nvim", ".git", "autoload", "plugin"},
        runtimepath = true
    },
    isNeovim = true,
    iskeyword = "@,48-57,_,192-255,-#",
    runtimepath = "",
    suggest = {fromRuntimepath = true, fromVimruntime = true},
    vimruntime = ""
}

require("lspconfig").clangd.setup {} -- cpp
require("lspconfig").pyright.setup {} -- python

-- require("lspconfig").ltex.setup { } -- tex
require("lspconfig").texlab.setup {}

require("lspconfig").cmake.setup {} -- cmake
