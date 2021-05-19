call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'fatih/vim-go'

Plug 'hdima/python-syntax'

Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'

Plug 'yuezk/vim-js'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'justinmk/vim-sneak'

call plug#end()

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

let g:coc_global_extensions = [
  \ 'coc-go',
  \ 'coc-rls',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-css',
	\ 'coc-tailwindcss',
	\ 'coc-styled-components',
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-emmet',
  \ ]

" Force vim to syntax refresh on tsx files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let mapleader=" "

set number relativenumber

" Tell vim to not make loads of crap files
set nobackup
set nowritebackup
set noswapfile

" Enable mouse
set mouse=a
set ttyfast

" Use system clipboard for first slot
set clipboard=unnamed

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set cmdheight=1

" Use tabs if tabs, spaces if spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype plugin indent on

" Becuase I have fat fingers
:command WQ wq
:command Wq wq
:command W w
:command Q q
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Press Escape to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Colours and syntax
set colorcolumn=80
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
syntax enable
colorscheme idlefingers
set background=dark
highlight SignColumn guibg=background

" Close close preview with ctrl + p
nmap <C-p> :pc<CR>

"Make enter create a new line and return out of insert mode
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Nerdtree
nnoremap <C-e> :NERDTreeToggle<CR>

nmap <Leader>t :Files<CR>
nmap <Leader>r :Rg<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
"
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_methods = 1

" " Commenting out
map <Leader><Leader> <plug>Commentary

" Stop cheating
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc and ultisnips
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Move tmux outside of vim
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call   CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call   CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline_section_z=''
let g:airline_skip_empty_sections = 1


" hi tsxTagName guifg=#ff9f5b
" hi tsxComponentName guifg=#ffbe4f
" hi tsxCloseComponentName guifg=#ffbe4f

" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxCloseTagName guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575

" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic

" " light-grey
" hi tsxTypeBraces guifg=#999999
" " dark-grey
" hi tsxTypes guifg=#666666
