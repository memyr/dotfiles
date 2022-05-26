" Basic .vimrc with a focus on portability

set number " number lines
syntax on " syntax highlighting
set mouse=a " use the mouse
set ruler " show where we are on the modeline
set clipboard=unnamed " sync clipboard with macos
set whichwrap=b,s,<,>,[,],h,l " go to a line above/below with these keys
set termguicolors=true

" Endcoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" tabs and indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set smarttab
set smartindent
set autoindent
set expandtab

" highlighting and searching
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" completion
set completeopt=menuone,noinsert

" splits
set splitbelow
set splitright

" scroll
set scrolloff=4
set sidescrolloff=8

set hidden " enable background buffers
set pumheight=10 " max number of items in the popup window
set cmdheight=2 " command line height

" cursor style in insert/normal mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" keybindings
set updatetime=300
set timeoutlen=1000
nnoremap <SPACE> <Nop>
let mapleader=" "

" sensible mappings
nnoremap <leader>h :noh<CR>
nnoremap Y y$ 

" windows
nnoremap <leader>wv :vs<CR> 
nnoremap <leader>ws :split<CR> 
nnoremap <leader>wj <C-w>j 
nnoremap <leader>wk <C-w>k 
nnoremap <leader>wl <C-w>l 
nnoremap <leader>wh <C-w>h 
nnoremap <leader>wd <C-w>q 

   " buffers
nnoremap <leader>bp :bp<CR> 
nnoremap <leader>b[ :bp<CR> 
nnoremap <leader>bn :bn<CR> 
nnoremap <leader>b] :bn<CR> 
nnoremap <leader>bd :bd<CR> 
nnoremap <leader>bb :ls<CR> 

" comment (python and bash) with gcc
nnoremap gcc I#<ESC>
nnoremap gcu ^x

" left explorer
nnoremap <leader>te :Vexplore<CR> 
