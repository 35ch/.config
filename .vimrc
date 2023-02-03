set nocompatible

set number
set nowrap
set nospell
set belloff=all
set tabstop=4
set hid

set nobackup
set nowb
set noswapfile

set showmatch

syntax enable
filetype plugin on

set background=dark

hi LineNR ctermfg=grey
hi EndOfBuffer ctermfg=black

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" File browsing
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 12

augroup SpawnNetrw
    autocmd!
    autocmd VimEnter * :Vexplore
    autocmd VimEnter * wincmd w
	autocmd BufLeave * :qa
augroup END
