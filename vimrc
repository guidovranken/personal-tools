" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

syntax on
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
filetype indent plugin on
set tabstop=4
set expandtab
set shiftwidth=4
filetype indent on
set cindent
set showmatch
set incsearch
set hlsearch
set number
set numberwidth=4
set showmode
set history=100
set showcmd
set ruler
set rulerformat=%=%h%m%r%w\ %(%c%V%),%l/%L\ %P
set pastetoggle=<F10>


" keep block highlighted when indenting
vmap >> >gv
vmap << <gv

set tags=./tags;

set cursorline
highlight Cursorline cterm=bold

nnoremap <C-F5> :w<Enter>:!%:p<Enter>

nnoremap <leader><space> :nohlsearch<CR>

map <C-]> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-Left>   :tp<CR>
nnoremap <A-Right>   :tn<CR>
color blue

map <F5> :w<CR>:!./%<CR>
map <F8> : !gcc % && ./a.out <CR>
"nnoremap R "_d
"#vnoremap R "_d
