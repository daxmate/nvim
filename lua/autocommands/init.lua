vim.cmd([[
augroup readonly keymapping
	autocmd!
	autocmd BufReadPost * if &readonly | nnoremap <buffer> d Lzz 
	autocmd BufReadPost * if &readonly | nnoremap <buffer> dd noop 
	autocmd BufReadPost * if &readonly | nnoremap <buffer> u Hzz
augroup end

augroup _general_setting
	autocmd!
	" autocmd BufEnter * silent! cd %:p:h " automatic change to the directory of current editing file
	autocmd BufEnter * silent! set path+=**/* " automatically add the directory of current editing file into search path
	autocmd BufWritePost $MYVIMRC nested luafile $MYVIMRC
	autocmd BufWritePost autocommands.lua luafile <afile>
	autocmd BufWritePost keymaps.lua luafile <afile>
	autocmd BufWritePost options.lua luafile <afile>
augroup end

" smart highlight search
augroup vimrc-incsearch-highlight
	autocmd!
	autocmd CmdlineEnter /,\? :set hlsearch
	autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" smart case
augroup dynamic_smartcase:
	autocmd!
	autocmd CmdlineEnter : set ignorecase
	autocmd CmdlineLeave : set smartcase
augroup END

augroup tex_key_binding
	autocmd!
	autocmd FileType tex :inoremap <buffer> / \
	autocmd FileType tex :inoremap <buffer> \ /
	autocmd FileType tex :set tabstop=4
augroup end

augroup cpp_key_binding
	autocmd!
	autocmd FileType cpp :inoremap <buffer> <leader>; <right>;
	autocmd FileType cpp :inoremap <buffer> <leader>: <esc>A;
augroup end

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

augroup lua
	autocmd!
	autocmd FileType lua :nnoremap <buffer> <f5> :luafile %<cr>
augroup end

]])
