call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-trailing-whitespace'

call plug#end()

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup
set noswapfile

set clipboard=unnamed

:command WQ wq
:command Wq wq
:command W w
:command Q q

" Enable file type detection and do language-dependent indenting.
filetype plugin indent off
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Close close preview with ctrl + p
nmap <C-p> :pc<CR>

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

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"Make enter create a new line and return out of insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>
nmap <F6> :TagbarToggle<CR>

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" remove separators
" remove unused modes
let g:airline_enable_syntastic=0
let g:airline_symbols.linenr = ''
" empty third and fourth sections
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])

let g:airline#extensions#default#layout = [
      \	["a", "b", "c"],
      \	["z", "error", "warning"]
      \ ]

" highligh jsx files in .js files§
let g:jsx_ext_required = 0

" ignore node modules etc
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Commenting out
map <Leader><Leader> <plug>Commentary

" Deoplete
let g:deoplete#enable_at_startup = 1
