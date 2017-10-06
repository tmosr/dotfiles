" start vim plug
call plug#begin('~/dotfiles/nvim/plugins')

" install plugins
" Color scheme
Plug 'lodestone/lodestone.vim'

" airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GitGutter
Plug 'jisaacks/GitGutter'

" Vim-R
Plug 'jalvesaq/Nvim-R'

" fugitive
Plug 'tpope/vim-fugitive'

" Matlab
Plug 'daeyun/vim-matlab'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Initialize plugin system
call plug#end()

" enable syntax highlighting
syntax on

" colorscheme
set background=dark
colorscheme lodestone

" set ident
filetype plugin indent on

set number        " enable line numbers
set expandtab 	  " insert spaces instead of tab
set tabstop=2		  " render TABs using this many spaces
set shiftwidth=2	" identation amount for < and > commands
set autoindent    " set autoindent
set smartindent   " set smart indent

" airline config
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tomorrow'

" vim-R settings
let R_assign = 0 " disable automatic replacement of underscores

" highlighting of to long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929

" matlab settings
autocmd Filetype matlab setlocal ts=4 sw=4 expandtab 
autocmd Filetype matlab match OverLength /\%81v.\+/  
