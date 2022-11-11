" $HOME/.config/nvim/init.vim
"
" GLOBAL OPTIONS:

" Have nvim use system CLIPBOARD using '+' register:
set clipboard+=unnamedplus

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
