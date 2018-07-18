" start vim plug 
call plug#begin('~/dotfiles/nvim/plugins')

" install plugins
" CtrlP 
Plug 'kien/ctrlp.vim'

" Color scheme
Plug 'lodestone/lodestone.vim'

" airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Vim-R
Plug 'jalvesaq/Nvim-R'
" rmarkdown support
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" fugitive
Plug 'tpope/vim-fugitive'
" Matlab
Plug 'daeyun/vim-matlab'
" Syntastic
Plug 'vim-syntastic/syntastic'
" easy align for markdown tables
Plug 'junegunn/vim-easy-align'

" vim markdown Plug 
Plug 'tpope/vim-markdown'

" vim table mode
Plug 'dhruvasagar/vim-table-mode'

" Initialize plugin system
call plug#end()

" enable syntax highlighting
syntax on

" colorscheme
set background=dark
colorscheme lodestone

" set ident
filetype plugin indent on
syntax enable

set number        " enable line numbers
set expandtab 	  " insert spaces instead of tab
set tabstop=2		  " render TABs using this many spaces
set shiftwidth=2	" identation amount for < and > commands
set autoindent    " enable auto (stupid) indentation
"set smartindent   " enable smart indentation

" automatic text width
set textwidth=80
set formatoptions+=t

" airline config
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'

" highlighting of to long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" matlab settings
autocmd Filetype matlab setlocal ts=4 sw=4 expandtab 
autocmd Filetype matlab match OverLength /\%81v.\+/  

" R indentation settings
let r_indent_align_args = 0   " disable alignment of function args
let r_indent_ess_comments = 1 " enable comment indenting

" vim-R settings
let R_assign = 0 " disable automatic replacement of underscores
let R_in_buffer = 0 " do not use buffer
let R_term = 'urxvt' " use urxvt as external terminal
let R_indent_commented = 1 " 

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" settings for table mode
"let g:table_mode_corner_corner='+'
"let g:table_mode_header_fillchar='='
"

" vim-pandoc settings
let g:pandoc#spell#default_langs = ["de_ch", "en"]
let g:pandoc#modules#enabled = ["formatting"]
let g:pandoc#formatting#textwidth = 79
let g:pandoc#formatting#mode = "sA"
