set nocompatible
filetype plugin on
syntax on
set nowrap
set hidden
set nu rnu
set clipboard+=unnamedplus
set shell=/usr/bin/zsh

let mapleader = " "

noremap <Leader>v :e $MYVIMRC<cr>
inoremap jk <Esc>
noremap <Leader>w :set wrap!<cr>

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

"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank' 
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Plugins configuration
let g:vimwiki_list = [{ 'path': '~/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]

let g:highlightedyank_highlight_duration = 300

" Theme
colorscheme gruvbox

" Autocommands
augroup vimwiki
	autocmd!
	autocmd BufWritePost ~/notes/* !cd ~/notes;git add "%";git commit -m "Auto commit of %:t." "%"; git push origin master
augroup END


" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path
if executable(s:clip)
    augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Configure for Python development
"let g:pymode_run_bind='<F5>'
imap <F5> <Esc>:w<CR>:!clear;python3 %<CR>

" HARD MODE
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>
