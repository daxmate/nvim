require("nvim-autopairs").setup {}
require("nvim-tree").setup {}
require("toggleterm").setup {}
require("gitsigns").setup {}
require("fzf-lua").setup {}
require("neodev").setup {library = {plugins = {"nvim-dap-ui"}, types = true}}

require("telescope").load_extension("dap")

require("plugins.cmp")
require("plugins.lsp")
require("plugins.autosave")
require("plugins.mason")
require("plugins.treesitter")
require("plugins.snips")
require("plugins.dap")
require("plugins.telescope")
require("nvim-dap-virtual-text").setup()
