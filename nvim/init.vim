" start vim plug 
call plug#begin('~/dotfiles/nvim/plugins')

" jsdoc 
Plug 'heavenshell/vim-jsdoc'

" dbext
Plug 'vim-scripts/dbext.vim'

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
" surround
Plug 'tpope/vim-surround'
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

" js beautify
Plug 'maksimr/vim-jsbeautify'

" javascript
Plug 'pangloss/vim-javascript'

" javascript syntax
Plug 'othree/javascript-libraries-syntax.vim'

" angular snipptes
Plug 'matthewsimo/angular-vim-snippets'

" testing
Plug 'claco/jasmine.vim'

" typescript
Plug 'leafgarland/typescript-vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
" Nerdtree Git extension
Plug 'Xuyuanp/nerdtree-git-plugin'

" cloase all buffers but this one
Plug 'schickling/vim-bufonly'

" pydocstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" python mode
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" TOML suppoert
Plug 'cespare/vim-toml'

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

set scrolloff=3   " always show 3 lines
set number        " enable line numbers
set expandtab 	  " insert spaces instead of tab
set tabstop=2		  " render TABs using this many spaces
set shiftwidth=2	" identation amount for < and > commands
set autoindent    " enable auto (stupid) indentation
"set smartindent   " enable smart indentation

" automatic text width
set textwidth=80
set formatoptions+=t

" pydocstring config
let g:pydocstring_doq_path = '/home/tobias/.venv/bin/doq'
let g:pydocstring_formatter = 'numpy'

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

" python settings
autocmd FileType python setlocal ts=4 sw=4 softtabstop=4 expandtab

" R indentation settings
let r_indent_align_args = 0   " disable alignment of function args
let r_indent_ess_comments = 1 " enable comment indenting

" vim-R settings
let R_assign = 0 " disable automatic replacement of underscores
let R_in_buffer = 0 " do not use buffer
let R_external_term = 'urxvt' " use urxvt as external terminal
let R_indent_commented = 1 " 

" Nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

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

" db connection
let g:dbext_default_profile_psql_adb = 'type=PGSQL:host=localhost:5432:dbname=adb:user=tobias'
let g:dbext_default_profile_psql_feldarbeit = 'type=PGSQL:host=localhost:5432:dbname=feldarbeit:user=tobias'
let g:dbext_default_profile_mysql_nism = 'type=MYSQL:host=server24.hostfactory.ch:3306:dbname=nism:user=tobias.moser:extra=--defaults-group-suffix=nism'
let g:dbext_default_profile = 'psql_adb'

" automatic minify of js files
function Js_css_compress ()
  let cwd = expand('<afile>:p:h')
  let nam = expand('<afile>:t:r')
  let ext = expand('<afile>:e')
  let home_dir = expand('$HOME')
  let npm_path = home_dir.'/.npm/'
  let project_dir = trim(system('git rev-parse --show-toplevel'))
  if -1 == match(nam, "[\._]src$")
    let minfname = nam.".min.".ext
  else
    let minfname = substitute(nam, "[\._]src$", "", "g").".".ext
  endif
  if ext == 'less'
    if executable('lessc')
      cal system( 'lessc '.cwd.'/'.nam.'.'.ext.' &')
    endif
  else
    if filewritable(cwd.'/'.minfname)
      if ext == 'js'
        if executable(npm_path.'/node_modules/.bin/babel')
          cal system( npm_path.'/node_modules/.bin/babel '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
        elseif executable('yui-compressor')
          cal system( 'yui-compressor '.cwd.'/'.nam.'.'.ext.' > '.cwd.'/'.minfname.' &')
        endif
      endif
    endif
  endif
endfunction

autocmd FileWritePost,BufWritePost *.js :call Js_css_compress()
autocmd FileWritePost,BufWritePost *.css :call Js_css_compress()
autocmd FileWritePost,BufWritePost *.less :call Js_css_compress()

" remap escape for shell emulator
tnoremap <Esc> <C-\><C-n>
