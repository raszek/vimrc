if has('vim_starting')
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
    set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')
let tmux_conf_exists=expand('~/.tmux.conf')

if !filereadable(tmux_conf_exists)
    silent !touch ~/.tmux.conf
    silent !echo "set -sg escape-time 10" > ~/.tmux.conf
    silent !echo "set -g default-terminal "screen-256color"" >> ~/.tmux.conf 
endif

if !filereadable(neobundle_readme)
    echo "Installing NeoBundle..."
    echo ""
    silent !mkdir -p ~/.config/nvim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
    let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'surround.vim'
NeoBundle 'EasyMotion'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'chrisgillis/vim-bootstrap3-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'eugen0329/vim-esearch'
NeoBundle 'w0rp/ale'
NeoBundle 'hecal3/vim-leader-guide'
NeoBundle 'chaoren/vim-wordmotion'
NeoBundle 'editorconfig/editorconfig-vim'
" LanguageServer
" NeoBundle 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" NeoBundle 'my-snippets'
" PHP
NeoBundle 'captbaritone/better-indent-support-for-php-with-html'
NeoBundle 'lumiliet/vim-twig'
NeoBundle 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
NeoBundle 'kristijanhusak/deoplete-phpactor'
" NeoBundle 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
" Latex
NeoBundle 'lervag/vimtex'
" Rust
NeoBundle 'rust-lang/rust.vim'
" Typescript
" NeoBundle 'leafgarland/typescript-vim'
" NeoBundle 'Shougo/vimproc.vim', {
" \ 'build' : {
" \     'windows' : 'tools\\update-dll-mingw',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make -f make_mac.mak',
" \     'linux' : 'make',
" \     'unix' : 'gmake',
" \    },
" \ }
" NeoBundle 'Quramy/tsuquyomi'
" NeoBundle 'maxmellon/vim-jsx-pretty'

" Elm
NeoBundle 'ElmCast/elm-vim'
call neobundle#end()

" Wymagane do pluginow
filetype plugin indent on
syntax on

NeoBundleCheck

"Kodowanie
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"Intendacje
set backspace=indent,eol,start
set smartindent
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
" Ukryte bufory
set hidden
" Wyszukiwanie
set hlsearch
set incsearch
set ignorecase
set smartcase
"Wskaznik przewijania, numerowanie linii, wsparcie dla myszy, brak swapow
set ruler
set number
set mouse=a
set ttyfast
set nobackup
set noswapfile
"slownik
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/polish
"Autouzupelnianie sciezek, ignorowanie przeszukiwania katalogow
set wildmenu
set wildignore+=*/vendor/*,vendor/*,*/node_modules/*,node_modules/*
set wildignorecase
set noundofile
"polaczenie schowka vima z systemowym
if has('unnamedplus')
    set clipboard=unnamedplus
endif
" Nie trzeba zjeżdżać na sam dół kursorem, brak migających kursorów
set gcr=a:blinkon0
set scrolloff=5
" rysowanie marginesu po 120 kolumnach
set colorcolumn=120
"chowanie znakow ^M
" set fileformats=dos
" zmiana sciezki na plik, ktory obecnie teraz edytujemy

let g:netrw_browsex_viewer="xdg-open"

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let g:lmap = { }
let g:lmap[' '] = { 'name': 'EasyMotion' }

" PHPActor
autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType php nmap <Leader>lu :call phpactor#UseAdd()<CR>
" Invoke the context menu
autocmd FileType php nmap <Leader>lm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
autocmd FileType php nmap <Leader>ln :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
autocmd FileType php nmap <Leader>lo :call phpactor#GotoDefinition()<CR>
" Transform the classes in the current file
autocmd FileType php nmap <Leader>lt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
autocmd FileType php nmap <Leader>lc :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
autocmd FileType php nmap <silent><Leader>lee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
" vmap <silent><Leader>lee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
autocmd FileType php vmap <silent><Leader>lem :<C-U>call phpactor#ExtractMethod()<CR>

" startowanie language serwera
" let g:LanguageClient_serverCommands = {
"         \ 'php': ['php', '~/Vagrant_projects/sellplex-vagrant/project/backend/src/vendor/felixfbecker/language-server/bin/php-language-server.php']
"     \ }

" autocmd FileType php LanguageClientStart
" let g:LanguageClient_diagnosticsEnable = 0
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> gk :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"Operacje na plikach
let g:lmap.f = { 'name' : 'File Menu' }
nnoremap <leader>fs :update<CR>
nnoremap <leader>fS :wa<CR>
nnoremap <leader>fc :NERDTreeClose<CR>:bd!<CR>
nnoremap <leader>fC :NERDTreeClose<CR>:bufdo bd<CR>
nmap <silent> <leader>fd :e $MYVIMRC<CR>
let g:lmap.f.d = ['e $MYVIMRC', 'Open vimrc']

"Operacje na oknach
let g:lmap.w = { 'name' : 'Window menu' }
nnoremap <Leader>ws :<C-u>split<CR>
nnoremap <Leader>wv :<C-u>vsplit<CR>
nnoremap <leader>wc :close<CR>
noremap <Leader>wj <C-w>j
noremap <Leader>wk <C-w>k
noremap <Leader>wl <C-w>l
noremap <Leader>wh <C-w>h
noremap <Leader>ww <C-w>w
noremap <Leader>wH <C-w>t<C-w>H
noremap <Leader>wK <C-w>t<C-w>K
noremap <Leader>wJ <C-w>t<C-w>J
noremap <Leader>wL <C-w>t<C-w>L
"Wychodzenie z vima
let g:lmap.q = { 'name': 'Quit menu' }
nnoremap <leader>qq :quitall<CR>
nnoremap <leader>qx :xa<CR>
"Robienie tabulacji w visual modzie
vmap < <gv
vmap > >gv
"Wylacz podswietlanie klawiszem esc
nnoremap <esc> :noh<return><esc>
"UI
let g:solarized_termcolors=256
set t_Co=256
set background=dark
set cursorline
set lazyredraw
colorscheme gruvbox
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline_powerline_fonts = 1
set laststatus=2

set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline\ 10
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

"powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

"Zakładki
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:lmap['1'] = ['LeaderGuide g:lmap.1 ', 'Go buffer 1']
let g:lmap['2'] = ['LeaderGuide g:lmap.2 ', 'Go buffer 2']
let g:lmap['3'] = ['LeaderGuide g:lmap.3 ', 'Go buffer 3']
let g:lmap['4'] = ['LeaderGuide g:lmap.4 ', 'Go buffer 4']
let g:lmap['5'] = ['LeaderGuide g:lmap.5 ', 'Go buffer 5']
let g:lmap['6'] = ['LeaderGuide g:lmap.6 ', 'Go buffer 6']
let g:lmap['7'] = ['LeaderGuide g:lmap.7 ', 'Go buffer 7']
let g:lmap['8'] = ['LeaderGuide g:lmap.8 ', 'Go buffer 8']
let g:lmap['9'] = ['LeaderGuide g:lmap.9 ', 'Go buffer 9']
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <S-j> :bp<CR>
nmap <S-k> :bn<CR>
nmap <C-j> :join<CR>
"EasyMotion
let g:EasyMotion_leader_key = '<Leader><Leader>'
"Operowanie na projekcie
let g:lmap.p = { 'name' : 'Project menu' }
"CTRLP
" let g:ctrlp_map = '<leader>pf'
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" nnoremap <leader>pr :CtrlPMRU<CR>
" nnoremap <leader>pb :CtrlPBuffer<CR>
" FZF
nmap <leader>pf :GFiles<CR>
nmap <leader>pg :GFiles?<CR>
nmap <leader>pb :Buffers<CR>

"NERDTree
nnoremap <leader>pt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
"Deoplete
" let g:deoplete#enable_at_startup = 1
"Autouzupelnianie
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3
"Snipety
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"Wyszukiwanie
let g:lmap.s = { 'name': 'Search menu' }
if !exists('g:esearch') | let g:esearch = {} | endif
let g:esearch.out = 'qflist'
if executable('ack')
    let g:esearch.adapter = 'ack'
    let g:esearch#adapter#ack#options = '--ignore-dir=vendor,node_modules'
endif

call esearch#map('<leader>sf', 'esearch')
call esearch#map('<leader>sw', 'esearch-word-under-cursor')


let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_php_phpmd_ruleset = 'cleancode,codesize,design,naming,unusedcode'
let g:ale_fix_on_save = 1
let g:tsuquyomi_disable_quickfix = 1

let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver'],
\   'php': ['phpstan'],
\}

"Autopairs
let g:AutoPairsMultilineClose = 0
"Emmet
let g:user_emmet_leader_key = '<C-e>'
"fugitive
let g:lmap.g = { 'name': 'Git menu' }
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>
"TComment
let g:lmap.c = { 'name': 'Comment menu' }
let g:lmap._ = ['LeaderGuide g:lmap._', 'TComment']
noremap <Leader>cc :TComment<CR>
noremap <Leader>cb :TCommentBlock<CR>
"VimTex
let g:vimtex_latexmk_continuous=0
" let g:llmap = {}
" autocmd FileType tex let g:llmap.l = { 'name' : 'vimtex' }
" call leaderGuide#register_prefix_descriptions(" ", "g:llmap")

"wylaczenie opoznienia gdy sie wcisnie klawisz esc
set timeout ttimeoutlen=0

" ostateczna konfiguracja vim leader guide
let g:topdict = {}
let g:topdict[' '] = g:lmap
let g:topdict[' ']['name'] = '<leader>'
" let g:topdict[','] = g:llmap
" let g:topdict[',']['name'] = '<localleader>'
call leaderGuide#register_prefix_descriptions("", "g:topdict")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
map <leader>. <Plug>leaderguide-global
" nnoremap <localleader> :<c-u>LeaderGuide  ','<CR>
" vnoremap <localleader> :<c-u>LeaderGuideVisual  ','<CR>
" map <localleader>. <Plug>leaderguide-buffer

" vsearch.vim
" Visual mode search
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  " Use this line instead of the above to match matches spanning across lines
  "let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>
" .editorconfig
" let g:EditorConfig_verbose = 1

map <F8> %s/\r//g<CR>
