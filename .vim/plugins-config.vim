" Themes Setup
colorscheme gruvbox
let g:gruvbox_constrast_dark = "hard"

" Config indentLine
let g:vim_json_syntax_conceal = 0

" Config NERDTree
" ** autorun
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeQuitOnOpen=1
