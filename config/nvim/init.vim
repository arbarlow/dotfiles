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
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'hdima/python-syntax'


Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let mapleader=" "

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup

set noswapfile
set mouse=a
set ttyfast

set clipboard=unnamed

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Better display for messages
set cmdheight=2

set expandtab
set shiftwidth=2
set softtabstop=2
filetype plugin indent on


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

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" " Commenting out
map <Leader><Leader> <plug>Commentary

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

let g:ale_linters = {'jsx': ['prettier'], 'js': ['prettier'], 'go': ['gopls', 'golangci-lint']}
let g:ale_linters_ignore = {'typescript': ['tslint', 'eslint']}
let g:ale_go_golangci_lint_options = "-E missspell"
let g:ale_go_langserver_executable = 'gopls'

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Auto  format on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
