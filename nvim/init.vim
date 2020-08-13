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
vnoremap jk <Esc>
nnoremap <Leader>g :Goyo<CR>
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

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


" vim-plug install
call plug#begin()

"Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
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


" ----------------------------------------------------------------------------
"  goyo.vim + limelight.vim
"  
"  ----------------------------------------------------------------------------
" " Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

" " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'

" " Default: 0.5
" let g:limelight_default_coefficient = 0.7

" " Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" " Beginning/end of paragraph
" "   When there's no empty line between the paragraphs
" "   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" " Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" function! s:goyo_enter()
" 	set noshowmode
" 	set noshowcmd
" 	set scrolloff=999
" 	Limelight
" 	" set background=light
" 	" set linespace=7
" 	" set wrap
" 	" Limelight
" 	" let &l:statusline = '%M'
" 	" hi StatusLine ctermfg=red guifg=red cterm=NONE
" endfunction

" function! s:goyo_leave()
" 	set showmode
" 	set showcmd
" 	set scrolloff=5
" 	Limelight!	
"  	" set background=dark
" 	" set linespace=0
" 	" set nowrap
" 	" Limelight!
" endfunction

" autocmd! User GoyoEnter nested call <SID>goyo_enter()
" autocmd! User GoyoLeave nested call <SID>goyo_leave()
