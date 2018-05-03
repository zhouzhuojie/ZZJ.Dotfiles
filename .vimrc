" no vi-compatible
set nocompatible
set encoding=utf-8 " Necessary to show Unicode glyphs

" required for vundle
filetype off

call plug#begin('~/.vim/plugged')

" terminalkeys
Plug 'nacitar/terminalkeys.vim'

Plug 'itchyny/lightline.vim'

" Test
Plug 'janko-m/vim-test'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" HTML
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'd11wtq/tomorrow-theme-vim'
Plug 'tpope/vim-haml'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'

" Code and files fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Zen coding
Plug 'mattn/emmet-vim'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'

Plug 'pangloss/vim-javascript'
Plug 'wavded/vim-stylus'
Plug 'scrooloose/syntastic'
Plug 'digitaltoad/vim-jade'

" XML/HTML tags navigation
Plug 'othree/html5.vim'
" Gvim colorscheme
Plug 'flazz/vim-colorschemes'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
" EasyMotion
Plug 'easymotion/vim-easymotion'
" AutoComplete
Plug 'Valloric/YouCompleteMe'

" Jinja2
Plug 'lepture/vim-jinja'
" Tabular
Plug 'godlygeek/tabular'
" Ag
Plug 'albfan/ag.vim'
Plug 'kchmck/vim-coffee-script'
" Pep8
Plug 'tell-k/vim-autopep8'
" GoLang
Plug 'fatih/vim-go'
Plug 'cespare/vim-go-templates'
" avro
Plug 'dln/avro-vim'
" thrift
Plug 'solarnz/thrift.vim'

Plug 'benmills/vimux'

Plug 'plasticboy/vim-markdown'

Plug 'vim-scripts/SyntaxRange'

Plug 'uarun/vim-protobuf'

Plug 'rhysd/vim-grammarous'

Plug 'posva/vim-vue'

Plug 'adelarsq/vim-matchit'


" Initialize plugin system
call plug#end()


" ==================== Settings ====================
"

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
noremap n nzzzv
noremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" allow plugins by file type
filetype plugin indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noshowmode

let mapleader = ','
let maplocalleader = '\'

" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
autocmd BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.ejs set filetype=html
au FileType python setlocal formatprg=autopep8\ -aa\ --indent-size\ 0\ -

" always show status bar
set ls=2

" backup and noswap
set noswapfile
set nobackup
set autoread
syntax on
set history=1000
set backspace=indent,eol,start


" incremental search
set incsearch

" highlighted search results
set hlsearch

" smartcase
set ignorecase
set smartcase

" line numbers
set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeTabsToggle<CR>
nmap <silent> gf :NERDTreeFind<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map <S-l> :tabn<CR>
map <S-h> :tabp<CR>
set switchbuf+=usetab,newtab

" navigate windows with meta+arrows
nmap <tab> <c-w>p

" jk to be esc
imap jk <ESC>
imap kj <ESC>

" show pending tasks list
" map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" Toggle Paste
set pastetoggle=<leader>p

nnoremap Q <Nop>
map q: :q

" Ag
if executable('ag')
  noremap gk :Ag <C-r>=expand('<cword>')<CR><CR>
  noremap <C-f> :Ag 
endif

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" theme settings
set t_Co=256
set background=dark
colorscheme molokai

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" try to fix slow on .go files
set nocursorline
syntax sync minlines=256
set re=1

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
" let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'

" Toggle noh
map  <c-x> :set hls!<CR>
imap <c-x> <ESC>:set hls!<CR>a
vmap <c-x> <ESC>:set hls!<CR>gv

" Shifting lines
vnoremap < <gv
vnoremap > >gv

" Mapping W and Q
:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qall qall
:command Wall wall

" Golden-ratio {
    " Don't resize automatically.
    let g:golden_ratio_autocommand = 0
    " Mnemonic: - is next to =, but instead of resizing equally, all windows are
    " resized to focus on the current.
    nmap <C-w>- <Plug>(golden_ratio_resize)
    " Fill screen with current window.
    nnoremap <C-w>+ <C-w><Bar><C-w>_
" }

" Tabularize {
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" Highlight whitespace {
    set list
    set listchars=tab:├─,trail:␠,nbsp:⎵
" }

nnoremap <localleader>u :GundoToggle<CR>

" 80 columns
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" Go ctags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Extra space for Nerd Commentor
let NERDSpaceDelims=1

" Quickfix enter jump
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" ycm
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_goto_buffer_command = 'new-or-existing-tab'
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>

" fzf
nnoremap <silent> <leader>e :FZF<CR>

" vim-js
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_auto_loc_list = 1

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["sh"] }

" ==================== Lightline ====================
"
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark', 'go'] ],
      \   'right': [ [ 'lineinfo' ], 
      \              [ 'percent' ], 
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'go': '%#goStatuslineColor#%{LightLineGo()}',
      \ },
      \ 'component_visible_condition': {
      \   'go': '(exists("*go#statusline#Show") && ""!=go#statusline#Show())'
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

" ==================== vim-go ====================
"
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:go_list_type = "locationlist"
let g:go_list_autoclose = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1
let g:go_term_enabled = 1
let g:go_alternate_mode = "tabedit"
let g:syntastic_aggregate_errors = 1
let g:go_fmt_command = "goimports"
let g:go_def_reuse_buffer = 1
let test#strategy = 'vimux'
nmap gc :GoCallers<CR>
nmap gi :GoInfo<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>f :TestNearest<CR>
nmap <leader>a :GoAlternate<CR>
nmap <leader>g :GoCoverageToggle<CR>
nmap <leader>i :GoSameIdsToggle<CR>
nmap <leader>d :GoDeclsDir<CR>

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>


" =================== markdown =========================
"
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

" =================== ruby =========================
"
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'jruby']
let g:EclimCompletionMethod = 'omnifunc'
nnoremap <leader>m :call VimuxRunCommand("clear; RACK_ENV=test bundle exec m " . bufname("%"))<CR>
nnoremap gt <C-]>
