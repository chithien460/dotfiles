set nocompatible
filetype plugin on
syntax on
set hidden
set nu rnu

let mapleader = " "

map <Space> <Leader>
noremap <Leader>v :e $MYVIMRC<cr>

" Enable Highlight Search
set nohlsearch
" Highlight while search
set incsearch
" Case Insensitivity Pattern Matching
set ignorecase
" Overrides ignorecase if pattern contains upcase
set smartcase

call plug#begin()

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'

call plug#end()

let g:vimwiki_list = [{ 'path': '~/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]

colorscheme gruvbox

augroup vimwiki
	au! BufWritePost ~/notes/* !git add "%";git commit -m "Auto commit of %:t." "%"
augroup END

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path
if executable(s:clip)
    augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
