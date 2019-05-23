call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'sbdchd/neoformat'
Plug 'mxw/vim-jsx'
Plug 'jparise/vim-graphql'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components'
Plug 'hdima/python-syntax'

call plug#end()

let mapleader=" "

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup

set noswapfile
set mouse=a
set ttyfast

set clipboard=unnamed

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
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

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

"Make enter create a new line and return out of insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>

nmap <Leader>t :FZF<CR>

" " CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Go settings
let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" " Commenting out
map <Leader><Leader> <plug>Commentary

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

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

set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

let python_highlight_all = 1

nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_python = ['isort', 'yapf']
let g:neoformat_run_all_formatters = 1
let g:neoformat_only_msg_on_error = 1
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.ts Neoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.html Neoformat
autocmd BufWritePre *.css Neoformat
autocmd BufWritePre *.py Neoformat
autocmd BufWritePre *.go Neoformat

autocmd FileType yaml setl indentkeys-=<:>

let g:autoflake_remove_all_unused_imports=1
let g:autoflake_remove_unused_variables=1
let g:autoflake_disable_show_diff=1

let g:ale_linters = {'jsx': ['prettier'], 'js': ['prettier'], 'go': ['golangci-lint']}
let g:ale_linters_ignore = {'typescript': ['tslint', 'eslint']}
let g:ale_go_golangci_lint_options = "-E missspell"
let g:ale_go_langserver_executable = 'gopls'
let g:javascript_plugin_flow = 1

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod'],
        \ }

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

