call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'buoto/gotests-vim'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/syntastic'
" Plug 'pangloss/vim-javascript'
" Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
" Plug 'mxw/vim-jsx'
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'majutsushi/tagbar'

call plug#end()

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup
set noswapfile

" set clipboard=unnamed

" Becuase I have fat fingers
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Enable file type detection and do language-dependent indenting.
filetype plugin indent off
filetype plugin indent on

" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" No startup message
set shortmess+=I

" Colours and syntax
set colorcolumn=80
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax enable
colorscheme idlefingers
set background=dark
set number

" Close close preview with ctrl + p
nmap <C-p> :pc<CR>

" "Make enter create a new line and return out of insert mode
" map <S-Enter> O<Esc>
" map <CR> o<Esc>

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>

" Tagbar
" nmap <F6> :TagbarToggle<CR>

" " CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1

au FileType go nmap <leader>r <Plug>(go-rename)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gt <Plug>(go-doc-tab)

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" " highligh jsx files in .js files§
" let g:jsx_ext_required = 0

" " Commenting out
map <Leader><Leader> <plug>Commentary

" " Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq = 0
