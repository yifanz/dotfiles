"execute pathogen#infect()
"
"dont pollute working directories with backup and swap files
"trailing slashes stores files using full paths to avoid conflicts
silent !mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

filetype plugin indent on
syntax on

" Don't be compatible with vi
" Probably don't need to explicitly set anymore
set nocompatible

set encoding=utf-8
set history=1000

" allow hidden buffers
set hidden

" Removes trailing spaces
function RemoveTrailingSpaces()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call RemoveTrailingSpaces()<CR>
autocmd BufWritePre * :call RemoveTrailingSpaces()

" number of spaces for existing tabs
set tabstop=4

" number of spaces for indent
set shiftwidth=4

" use spaces instead of tabs
set expandtab

" number of space for when you hit tab
set softtabstop=4

" Don't wrap lines
"set nowrap

" Allow backspace to delete indents, end and start of lines
set backspace=indent,eol,start

" set auto indenting on
set autoindent

set cindent
set cinoptions=t0,:0

" always show cursor position
set ruler

" show tab characters and end of line marker
"set list

" if tab size is 4 then it will displayed as >...
"set listchars=tab:>.

" show line numbers
set number

" show relative line numbers
" set rnu

" always show status bar
set laststatus=2

" scroll before cursor hits bottom
set scrolloff=3

set showmode
set showcmd

" improved tab completion
set wildmenu
set wildmode=list:longest

"set cursorline

" search
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

" http://bytefluent.com/vivify/
syntax enable
"colorscheme inkpot
"colorscheme SolarizedDark
"colorscheme baycomb
"colorscheme blackboard
"colorscheme blugrine
"colorscheme candycode
"colorscheme darkmate
"colorscheme inkpot
"colorscheme native
"colorscheme paintbox
"colorscheme phd
"colorscheme railscasts

":set background=dark
":color desert

" if using GUI then
"if has("gui_running")
"  color phd
"endif

"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40
"let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
