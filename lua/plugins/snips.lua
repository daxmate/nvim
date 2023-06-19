-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("cmp_nvim_ultisnips").setup {}
