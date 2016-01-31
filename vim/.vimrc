"Pathogen
filetype off
execute pathogen#infect()
filetype plugin indent on

"Set theme
colorscheme molokai

"Set syntax on
syntax on

"I use vim, not vi :)
set nocompatible

"Fix tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"utf-8 encoding
set encoding=utf-8

"Always have 3 lines above and below cursor
set scrolloff=3

"Set indention to whatever is in the nearest line if filetype is unknown
set autoindent

"Show what mode you're in
set showmode

"Show what command is being run
set showcmd

"Hide buffers instead of closing them
set hidden

"Better filename completion
set wildmenu
set wildmode=list:longest

"Flash screen instead of sounding beep
set visualbell

"Hilite current line
set cursorline

"Faster Scrolling
set ttyfast

"Show where you are in the file
set ruler

"deleting indentation, line breaks, pre-existing characters
set backspace=indent,eol,start

"Always show status line
set laststatus=2

"Set some colors
hi User1 ctermfg=18  ctermbg=105
hi User2 ctermfg=Black  ctermbg=95
hi User3 ctermfg=Black  ctermbg=90
hi User4 ctermfg=Black  ctermbg=82
hi User5 ctermfg=Black  ctermbg=82
hi User7 ctermfg=White  ctermbg=72 gui=bold
hi User8 ctermfg=Black  ctermbg=145
hi User9 ctermfg=White  ctermbg=69
hi User0 ctermfg=White  ctermbg=36

"Setup statusline
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

"Line numbers are relative to make moving around easier
set relativenumber

"Better Undo
set undodir=~/.vim/undo
set undofile
set undolevels=10000
set undoreload=100000

"Create all swp files in one spot
set dir=~/.vim/undo

"Set leader to comma
let mapleader = ","

"case insensitive search by default
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

"global replace by default
set gdefault

"better searching
set incsearch
set showmatch
set hlsearch

"leader space = clear hiliting
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"Wrap text
set wrap
set textwidth=79

"Nice pasting and numbered lists and such
set formatoptions=qrn1

"Disable arrow keys to force hjkl muscle memory
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"set python syntax hiliting options
let python_version_2 = 1
let python_highlight_all =1

"Make md = markdown hiliting
au BufRead,BufNewFile *.md set filetype=markdown
