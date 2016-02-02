set nocompatible
filetype off
set shortmess+=I

call plug#begin()

Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'kylef/apiblueprint.vim'
Plug 'cespare/vim-toml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Chiel92/vim-autoformat'

call plug#end()  

set clipboard=unnamed

" Tell Vim there is 256 colours available
set t_Co=256

" Enable line numbers
set number

" Switch syntax highlighting on
syntax enable
set background=dark
set hlsearch
set cursorline

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup 
set noswapfile   

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

" Use leader t for CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'

if exists("&colorcolumn")
  set colorcolumn=80
end

if has("mouse")
  set mouse=a
endif

" Custom mappings
"
"Make enter create a new line and return out of insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nmap <C-p> :pc<CR>

colorscheme idleFingers

set laststatus=2

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" highligh jsx files in .js files§
let g:jsx_ext_required = 0

au BufWrite * :Autoformat
