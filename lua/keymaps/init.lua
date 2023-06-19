vim.cmd([[
augroup autosource
  autocmd!
  autocmd BufWritePost <buffer> % luafile %
augroup end
]])

local silent_opts = {noremap = true, silent = true}
local opts = {noremap = true}
-- local term_opts = {silent = true}
local keymap = vim.keymap.set

-- set leader key
vim.g.mapleader = ","

-- help window vertical split on right side
vim.cmd("cnoreabbrev hr vert bo h")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- jk to Escape
keymap("i", "jk", "<esc>", opts)

-- half page up and down remapping
keymap("n", "<space>d", "Lzz", opts)
keymap("n", "<space>u", "Hzz", opts)

-- move between buffers
keymap("n", "<f9>", ":bn<cr>", silent_opts)
keymap("n", "<f7>", ":bp<cr>", silent_opts)
keymap("n", "<f8>", ":Bdelete<cr>", silent_opts)
keymap("n", "<f10>", ":Bwipeout<cr>", silent_opts)

-- keybindings for easymotion
keymap("n", "<leader><leader>gf", "<Plug>(easymotion-overwin-f)", silent_opts)
keymap("n", "<leader><leader>gw", "<Plug>(easymotion-overwin-w)", silent_opts)
keymap("n", "<leader><leader>l", "<Plug>(easymotion-overwin-line)", silent_opts)

-- shortcut for search and replace
keymap("n", "<leader>s", ":%s///g<left><left>", opts)

-- expand active buffer folder

keymap("c", "%%", "getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'",
       {expr = true})

-- edit most used files shortcuts, all start with `e`
keymap("n", "<leader>ev", ":e! $MYVIMRC<cr>", silent_opts)
keymap("n", "<leader>ec",
       ":e! ~/Library/Application Support/V2RayX/pac/pac.js<cr>", silent_opts)
keymap("n", "<leader>eu", ":e! ~/Library/Rime/wubi86_user.dict.yaml<cr>",
       silent_opts)
keymap("n", "<leader>ez", ":e! ~/.zshrc<cr>", silent_opts)
keymap("n", "<leader>ep", ":e! ~/Library/Application Support/V2RayX/pac/pac.js<cr>", opts)
keymap("n", "<leader>ec", ":Telescope find_files cwd=~/.config/nvim<cr>", opts)
keymap("n", "<leader>eu", ":e! ~/Library/Rime/wubi86_user.dict.yaml<cr>",
       opts)

-- shortcuts for retrieving from registers, all start with `r`
keymap({"i", "c"}, "<leader>r", "<c-r><c-p>", opts) -- after <leader>r input a register name 0, +, " etc.
keymap({"i", "c"}, "<leader>rc", "<c-r><c-p>\"", opts) -- retrieve data from unnamed register
keymap({"i", "c"}, "<leader>ry", "<c-r><c-p>0", opts) -- retrieve data from 0 register which stores data from yank operation
keymap("c", "<leader>ra", "<c-r><c-a>", opts) -- <WORD> under cursor
keymap("c", "<leader>rw", "<c-r><c-w>", opts) -- <word> under cursor
keymap("c", "<leader>rp", "<c-r><c-p>", opts) -- expand path under cursor
keymap("c", "<leader>rf", "<c-r><c-f>", opts) -- filename under cursor
keymap("c", "<leader>rl", "<c-r><c-l>", opts) -- line under cursor

-- Move lines up and down
keymap("n", "<c-j>", ":m .+1<CR>==", opts)
keymap("n", "<c-k>", ":m .-2<CR>==", opts)
keymap("v", "<c-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<c-k>", ":m '<-2<CR>gv=gv", opts)
keymap("i", "<c-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<c-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Window operations
keymap("n", "<leader>wh", "<c-w>h", opts)
keymap("n", "<leader>wl", "<c-w>l", opts)
keymap("n", "<leader>wk", "<c-w>k", opts)
keymap("n", "<leader>wj", "<c-w>j", opts)
keymap("n", "<leader>wH", "<c-w>H", opts)
keymap("n", "<leader>wL", "<c-w>L", opts)
keymap("n", "<leader>wK", "<c-w>K", opts)
keymap("n", "<leader>wJ", "<c-w>J", opts)
keymap("n", "<leader>vs", ":vs<cr>", opts) -- split vertically
keymap("n", "<leader>sp", ":vs<cr>", opts) -- split horizontally
keymap("t", "<leader>wh", "<c-\\><c-n>:wincmd h<cr>", silent_opts) -- move cursor to other window from terminal
keymap("t", "<leader>wj", "<c-\\><c-n>:wincmd j<cr>", silent_opts) -- move cursor to other window from terminal
keymap("t", "<leader>wk", "<c-\\><c-n>:wincmd k<cr>", silent_opts) -- move cursor to other window from terminal
keymap("t", "<leader>wl", "<c-\\><c-n>:wincmd l<cr>", silent_opts) -- move cursor to other window from terminal

-- resize windows with arrows
keymap("n", "<s-right>", ":vertical resize +2<cr>", opts)
keymap("n", "<s-left>", ":vertical resize -2<cr>", opts)

-- formatter
keymap("n", "<leader>f", ":Neoformat<cr>", silent_opts)

-- switches  -- starts with s
keymap("n", "<leader>se", ":NvimTreeToggle<cr>", opts) -- toggle explorer on the left
keymap("n", "<leader>sl", ":set list!<cr>", opts) -- toggle list mode
-- keymap("n", "<leader>sd", ":Dashboard<cr>", opts) -- open bashboard
keymap("n", "<leader>st", ":ToggleTerm direction=float<cr>", silent_opts) -- toggle terminal
keymap("t", "<leader>st", "<c-\\><c-n>:ToggleTerm<cr>", silent_opts) -- toggle terminal
keymap({"n", "i", "v"}, "<leader>sb", ":TagbarToggle<cr>", opts) -- toggle tagbar

-- keybindings for telescope
keymap("n", "<leader>tf", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>to", ":Telescope oldfiles<cr>", opts)
keymap("n", "<leader>tj", ":Telescope jumplist<cr>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>oa", ":call QuickFixOpenAll()<cr>", opts)

-- keybindings for cmake
keymap("n", "<leader>cg", "<Plug>(CMakeGenerate)", opts)
keymap("n", "<leader>cb", ":CMakeBuild -j12<cr>", opts)
keymap("n", "<leader>ci", "<Plug>(CMakeInstall)", opts)
keymap("n", "<leader>cs", "<Plug>(CMakeSwitch)", opts)
keymap("n", "<leader>co", "<Plug>(CMakeOpen)", opts)
keymap("n", "<leader>cq", "<Plug>(CMakeClose)", opts)

-- debug
keymap("n", "<F11>", ":lua require('dapui').open()<cr>")
keymap("n", "<F12>", ":lua require('dapui').close()<cr>")

-- lsp quickfix settings
local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a)
            return a.isPreferred
        end,
        apply = true
    })
end

vim.keymap.set("n", "<leader>qf", quickfix, opts)


-- ctest
vim.cmd("cnoreabbrev ctest CMakeTest -V -R")
