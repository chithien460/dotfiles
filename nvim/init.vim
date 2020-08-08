set nocompatible
filetype plugin on
syntax on
set nowrap
set hidden
set nu rnu
set clipboard+=unnamedplus

let mapleader = " "

noremap <Leader>v :e $MYVIMRC<cr>
inoremap jk <Esc>

" Enable Highlight Search
set nohlsearch
" Highlight while search
set incsearch
" Case Insensitivity Pattern Matching
set ignorecase
" Overrides ignorecase if pattern contains upcase
set smartcase


set encoding=UTF-8
set mouse=a 

set tabstop=4 
set softtabstop=0
set shiftwidth=4

" vim-plug install
call plug#begin()

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank' 
Plug 'morhetz/gruvbox'

call plug#end()

" make it rain
let g:vimwiki_list = [{ 'path': '~/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]

let g:highlightedyank_highlight_duration = 300

" love shine a light
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
