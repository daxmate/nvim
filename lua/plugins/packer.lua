return require("packer").startup(function(use)
    use "wbthomason/packer.nvim" -- The packer manager itself
    use "nvim-lua/plenary.nvim" -- a common plugin used by many other plugins

    use "Pocco81/auto-save.nvim" -- auto save

    -- themes and appearance
    use "NLKNguyen/papercolor-theme"
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use "famiu/bufdelete.nvim" -- keep window layout while deleting buffer

    -- use "glepnir/dashboard-nvim" -- pop a dashboard on start
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua" -- file explorer

    use "sheerun/vim-polyglot" -- syntax highlight
    -- use "MunifTanjim/nui.nvim"
    -- use "rcarriga/nvim-notify"
    -- use "folke/noice.nvim" -- cmdline and message window

    -- tpope plugins
    use "tpope/vim-fugitive" -- with fugitive plugin, airline will display branch symbol, A plugin for Git
    use "tpope/vim-commentary" -- comment
    use "tpope/vim-eunuch" -- unix shell commands
    use "tpope/vim-surround" -- operations on pairs
    use "tpope/vim-repeat"

    use "windwp/nvim-autopairs"

    -- formatter
    use "sbdchd/neoformat"

    use "easymotion/vim-easymotion" -- easymotion

    -- plugin for tex
    use "lervag/vimtex"

    -- completion and lsp
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "williamboman/mason.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lua"

    use "SirVer/ultisnips" -- ultisnips
    use "quangnguyen30192/cmp-nvim-ultisnips" -- nvim-cmp support

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets" -- provide so many snippets

    -- telescope fuzzy info finder
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-live-grep-args.nvim"

    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter"
    })
    use "jessekelighine/vim-SimpleColorsLatex"

    -- fzf
    use "junegunn/fzf"
    use "ibhagwan/fzf-lua"

    -- programming
    use "preservim/tagbar" -- tagbar
    use "cdelledonne/vim-cmake" -- cmake
    use "akinsho/toggleterm.nvim" -- terminal
    use "lewis6991/gitsigns.nvim"
    use "gauteh/vim-cppman"

    -- debug
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "folke/neodev.nvim"
    use "nvim-telescope/telescope-dap.nvim"
    use "theHamsta/nvim-dap-virtual-text"

end)
