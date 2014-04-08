filetype off
execute pathogen#infect()
filetype plugin indent on
colorscheme molokai
syntax on
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
hi User1 ctermfg=18  ctermbg=105
hi User2 ctermfg=Black  ctermbg=95
hi User3 ctermfg=Black  ctermbg=90
hi User4 ctermfg=Black  ctermbg=82
hi User5 ctermfg=Black  ctermbg=82
hi User7 ctermfg=White  ctermbg=72 gui=bold
hi User8 ctermfg=Black  ctermbg=145
hi User9 ctermfg=White  ctermbg=69
hi User0 ctermfg=White  ctermbg=36
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
set relativenumber
set undodir=~/.vim/undo
set undofile
set undolevels=10000
set undoreload=100000
let mapleader = ","
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap <F19> i
inoremap <F19> <Esc>l
let python_version_2 = 1
let python_highlight_all =1
au BufRead,BufNewFile *.md set filetype=markdown
