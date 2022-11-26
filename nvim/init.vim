" $HOME/.config/nvim/init.vim
"
"------------------------------------------------------------------------------
" VIM-PLUG:
" N.B.:  vim-plug section must be at the BEGINNING of this file!

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
call plug#end()
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" PLUGIN CONFIGURATIONS:
"
" Configure csv.vim:
" Formats each cell of csv file in a more readable way when buffer is written.
" Does not save this formatting when you write the csv file.
augroup filetype_csv
    autocmd!

    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" GLOBAL OPTIONS:

" Have nvim use system CLIPBOARD using '+' register:
set clipboard+=unnamedplus

" Make <space> the leader key:
nnoremap <space> <nop>
let mapleader = "\<space>"

" Turn off swap file protection:
set noswapfile

" Make undo/redo persistent:
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=1000

" Set line number:
set number

" Tab replaced by 4 spaces
" Copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"------------------------------------------------------------------------------
