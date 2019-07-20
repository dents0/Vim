"  ---------------- COLORS ----------------

" colorscheme:
"colorscheme delek 

" syntax processing:
syntax enable


" ------------ SPACES & TABS -------------

" number of visual spaces per TAB:
set tabstop=4

" number of spaces in tab when editing:
set softtabstop=4

" tabs are spaces:
set expandtab


" -------------- UI Config----------------

" show line numbers:
set number

" show command in bottom bar:
set showcmd

" highlight current line:
set cursorline

" load filetype-specific indent files:
filetype indent on

" visual autocomplete for command menu:
set wildmenu

" redraw only when we need to:
set lazyredraw

" highlight matching [{()}]:
set showmatch


" ---------- LEADER SHORTCUTS ------------

" leader is comma:
let mapleader=","


" ------------- SEARCHING ----------------

" search as characters are entered:
set incsearch

" highlight matches:
set hlsearch

" turn off search highlight:
nnoremap <leader><space> :nohlsearch<CR>



" -------------- FOLDING -----------------

" enable folding:
set foldenable

" open most folds by default:
set foldlevelstart=10

" 10 nested fold max:
set foldnestmax=10

" space open/closes folds:
nnoremap <spase> za

" fold based on indent level:
set foldmethod=indent



" ------------- MOVEMENT -----------------

" move vertically by visual line:
nnoremap j gj
nnoremap k gk

" highlight the last inserted text:
nnoremap gV `[v`]


" --------------- TMUX -------------------

" allows cursor change in tmux mode:
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" ------------- AUTOGROUPS ---------------

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


