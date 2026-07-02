ОСНОВНЫЕ НАСТРОЙКИ 
syntax on
filetype plugin indent on
set number
set relativenumber
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase smartcase
set incsearch hlsearch
set nobackup noswapfile
set wildmenu
set wildmode=list:longest

АВТОЗАКРЫТИЕ СКОБОК 
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

ПЛАГИНЫ 
call plug#begin('~/.vim/plugged')
  Plug 'stephpy/vim-yaml'
  Plug 'dense-analysis/ale'
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/fzf.vim'
call plug#end()

ГОРЯЧИЕ КЛАВИШИ 
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :grep! 
nmap <F4> :nohlsearch<CR>
nmap <leader>f :Files<CR>
nmap <leader>/ :Rg<CR>

Подсветка YAML
au! BufRead,BufNewFile *.yml,*.yaml set filetype=yaml
