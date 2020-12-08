call plug#begin('~/config/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Syntax
Plug 'sheerun/vim-polyglot' 

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'
Plug 'yggdroot/indentline'

" Tree
Plug 'scrooloose/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" autocomplete
" Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

call plug#end()
