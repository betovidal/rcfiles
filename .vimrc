set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Include fzf path as well
if has('win32')
  set list          " Display unprintable characters f12 - switches
  set listchars=tab:\|\ ,trail:-,extends:>,precedes:< " Unprintable chars mapping
  " For windows, install via chocolatey (choco install fzf)
  " and make this line point to its git repository.
  set rtp+=~/git_repositories/fzf
else
  set rtp+=~/Downloads/git_repositories/fzf
  " Print trailing spaces
  set list          " Display unprintable characters f12 - switches
  set listchars=tab:\·\ ,trail:-,extends:>,precedes:< " Unprintable chars mapping
endif
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" ========== VUNDLE PACKAGES ==========
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ajh17/VimCompletesMe'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
" First I need to install jshint via: npm -g install jshint (and available @ PATH)
" For styles, install jscs too.
" NOTE: Other languages require different linters/syntax checkers
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'Raimondi/delimitMate'
" ,b to open the buffer navigator
Plugin 'jeetsukumaran/vim-buffergator'
" Vertical lines on indent space (like in subl)
" Assigned to Ctrl + P (install fzf on the system, check fzf.vim)
Plugin 'junegunn/fzf.vim'
" Syntax related
Plugin 'pangloss/vim-javascript'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'vim-jp/vim-cpp'
" Plugin 'sheerun/vim-polyglot'
" Assigned to Ctrl + T, switch between dictionary (custom see below)
Plugin 'AndrewRadev/switch.vim'
" When searching, display total occurrences of match
Plugin 'henrik/vim-indexed-search'
" :Tab /{pattern} -> Even in visual mode
Plugin 'godlygeek/tabular'
" gcc, gc{motion}
Plugin 'tpope/vim-commentary'
" Check vim's undo tree by pressing <F3>
Plugin 'mbbill/undotree'
" Tern it!
"to install tern clone https://github.com/ternjs/tern_for_vim.git into
".vim/bundle, then cd tern_for_vim and run the command "npm install"
" Plugin 'ternjs/tern_for_vim'
" First I need to install universal-ctags:
" -------------Update VIM to something after 27/Nov/16------------------
" git clone https://github.com/universal-ctags/ctags.git
" (as described in docs/autotools.rst)
" cd ctags
" $ ./autogen.sh
" $ ./configure --prefix=/where/you/want # defaults to /usr/local (using /usr/local)
" $ make
" $ make install # may require extra privileges depending on where to install
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'majutsushi/tagbar' <-- This is just for showing a panel
" indentLine needs vim-json to work properly with json files (or else quotes
" are missing)
" snipets!
" Lighter indent lines
" Plugin 'thaerkh/vim-indentguides'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
" Dracula Theme!
Plugin 'dracula/vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" For closing description (scratch) buffer when completing
" set conceallevel=0
" setl conceallevel=0
" let g:indentLine_setConceal=0
" let g:vim_json_syntax_conceal = 0
" Otherwise vim-json does nothing at all
hi! def link jsonKeyword Identifier
" ================================== AIRLINE ==================================
" For airline to start without the need of creating a new split
set laststatus=2
" Set appropiate characters for airline bar
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
" Let tagbar where ctags executable is:
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" ================================== ALE ==================================
" Force ALE to use global executables
let g:ale_javascript_eslint_use_global=1
let g:ale_javascript_jscs_use_global=1
let g:ale_javascript_jshint_use_global=1
let g:ale_completion_enabled=1
" Time saving
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save  = 1
" Leave gutter open
let g:ale_sign_column_always=1
" ALE change notification icons
let g:airline#extensions#ale#enabled=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" "============================ Buffer Gator ===========================
let g:buffergator_autoexpand_on_split=0
" "============================ dracula.vim ===========================
let g:dracula_italic=0
" ================================== FZF.VIM = ============================
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
command! SearchWithFZFandRipGrep call fzf#run(fzf#wrap({
  \'source'  : 'rg --files --follow --hidden --glob !.git/* --glob !node_modules/*',
  \'options' : '-m'
\}))
noremap <C-P> :SearchWithFZFandRipGrep <CR>
" ================================== GUTENTAGS =============================
let g:gutentags_cache_dir='~/.vim/tags'
let g:gutentags_ctags_exclude = ['node_modules', '.git', '*.min.js']
let g:gutentags_file_list_command = "rg --files -g '*.{js,h,c,py}'"
" let g:gutentags_resolve_symlinks = 1
" let g:gutentags_trace = 1
" ================================== VIM.LSP ===================================
" Install: npm install -g javascript-typescript-langserver
if executable('javascript-typescript-langserver')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript-typescript-langserver',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'javascript-typescript-stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx']
      \ })
    autocmd FileType javascript setlocal omnifunc=lsp#complete
endif
" To enable preview window:
set completeopt+=preview
" To auto close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
" ================================== SWITCH.VIM ============================
let g:switch_custom_definitions =
\[
\ {
\   'width':  'height',
\   'height': 'width'
\ },
\ {
\   'top':  'bottom',
\   'bottom': 'top'
\ },
\ {
\   'left':  'right',
\   'right': 'left'
\ },
\ {
\   'Left':  'Right',
\   'Right': 'Left'
\ },
\ {
\   'up':  'down',
\   'down': 'up'
\ },
\ {
\   'top'    :  'bottom',
\   'bottom' : 'top'
\ },
\ {
\   '+': '-',
\   '-': '+'
\ },
\ {
\   '*': '/',
\   '/': '*'
\ },
\ {
\   ' > ': ' < ',
\   ' < ': ' > '
\ },
\ {
\   'min': 'max',
\   'max': 'min'
\ },
\ {
\   'Min': 'Max',
\   'Max': 'Min'
\ },
\ {
\   'upper': 'lower',
\   'lower': 'upper'
\ },
\ {
\   'high': 'low',
\   'low': 'high'
\ },
\ {
\   'High': 'Low',
\   'Low': 'High'
\ },
\ {
\   'Before': 'After',
\   'After': 'Before'
\ },
\ {
\   'before': 'after',
\   'after': 'before'
\ },
\ {
\   'On': 'Off',
\   'Off': 'On'
\ },
\ {
\   'on': 'off',
\   'off': 'on'
\ }
\]
nnoremap <C-t> :Switch <CR>
" ======================== UTILSNIPS =======================
" Important!! Ctrl+Space was remapped in urxvt and disabled from ibus through:
" (Command in terminal)
" gsettings set org.freedesktop.ibus.general.hotkey triggers []
" to execute the same char code as F11:
" urxvt.keysym.Control-Tab: \033[23~
" where \033 is the octal code for ESCAPE and [23~ is F11
"                            Ctrl + Space is mapped to trigger F11
let g:UltiSnipsExpandTrigger="<F11>"
" ================================ Vim Indent Guides ==========================
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
let g:indent_guides_tab_guides = 0
" ================================ _My functions START_ =======================
function MDOpen()
	if &filetype == 'markdown'
		if has('win32')
			echo 'I do not know how to do this here! Be patient'
		else
			let full_path = expand('%:p')
			" let full_path = '/home/tocino/Notes/texto.md'
			execute "!cat " . full_path . " | cmark | google-chrome \"data:text/html;base64,$(base64 -w 0 <&0)\"\<cr>"
		endif
	else
		echo 'This is not a markdown file!'
	endif
endfunction
" ================================ _My functions END_ =========================

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray24 ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray24 ctermbg=8
" Display command on bottom
set showcmd
" Complete ex commands
set wildmenu
set wildmode=longest:full,list:full
" My own remapped keys:
" For opening NERDTree
" silent! nmap <F2> :NERDTreeToggle<CR>
nnoremap j gj
nnoremap k gk
noremap  <F2> :NERDTreeToggle<CR>
" silent! nmap <C-S-L> :%!python -m json.tool<CR>
" gt and gT to navigate between tabs, now I'll navigate through buffers
nmap gt :bnext <CR>
nmap gT :bprevious <CR>
nmap <F3> :UndotreeToggle<CR>
" For opening tagbar
nmap <F4> :TagbarToggle<CR>
" Override \ as leader key
let mapleader=","
" Overriden in urxvt/st config
nnoremap <F9>  : bprev<CR>
nnoremap <F10> : bnext<CR>
" Clear search highlight on <F5>
nnoremap <F5> :noh<return><esc>
" Default tab spacing
" tabstop maximum size of a tab measured in spaces
" tabstop maximum size of a tab measured in spaces
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
" Undo files (useful while using buffers instead of tabs)
set undofile undodir=~/.vim/undo
" For C
autocmd Filetype c setlocal ts=8 sw=8
autocmd Filetype h setlocal ts=8 sw=8
" For python
autocmd Filetype py setlocal ts=2 sw=2 expandtab
" For javascript, css, html
autocmd Filetype javascript setlocal ts=4 sw=4 expandtab
autocmd Filetype css setlocal ts=4 sw=4 expandtab
autocmd Filetype html setlocal ts=4 sw=4 expandtab
" Add built in packages
" Matches opening/closing tags (html, xml)
packadd matchit
" Don't open the zip explorer
let g:loaded_zipPlugin= 1
let g:loaded_zip      = 1
" Misc configurations
syntax on
set number
set t_Co=256
" colorscheme molokai
colorscheme dracula
" Do not use polyglot with the following filetypes:
" let g:polyglot_disabled = ['markdown', 'text', 'json', 'html5']
set incsearch
" Fix cursor dissappear on current parenthesis (override color scheme)
" hi MatchParen cterm=bold ctermbg=none ctermfg=200
hi MatchParen cterm=bold ctermbg=226 ctermfg=0
" Highlight column 81 (it's ok to code before it).
set colorcolumn=81,121
set directory-=~/.vim/tmp
set directory^=~/.vim/tmp//
set backupdir-=~/.vim/tmp
set backupdir^=~/.vim/tmp//
set ruler
set hlsearch
if has("win32")
  set belloff=all
  " Kill pop ups
  set guioptions+=lrbmTLce
  set guioptions-=lrbmTLce
  set guioptions+=c
  " Do not blink, block cursor
  set guicursor+=a:blinkon0
  set guicursor+=a:block-Cursor
  " Fix line endings
  set ff=unix " This fixes extra line breaks in google.keep
  " Fix line endings
  set encoding=utf-8
  " Avoid mouse interaction other than selecting
  set mouse=c
  set guifont=terminus:h14
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove toolbar
  set guioptions-=r "remove right-hand scroll bar
  set guioptions-=L "remove left-hand scroll bar
  " Move across buffers
  nnoremap <C-S-Tab> : bprev<CR>
  nnoremap <C-Tab>   : bnext<CR>
  " Util snips KB shortcut to expand
  let g:UltiSnipsExpandTrigger="<C-Space>"
  " Non unicode symbols
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.linenr = 'LN'
  let g:airline_symbols.branch = 'Y'
  let g:airline_symbols.paste = 'P'
  let g:airline_symbols.whitespace = '_'
  let g:airline_symbols.readonly = 'RO'
  let g:ale_statusline_format = ['x %d', '! %d', 'OK']
  let g:ale_sign_error = 'x'
elseif has("unix")
  " unicode symbols
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:ale_statusline_format = ['✖ %d', '⚠ %d', '✓ ok']
  let g:ale_sign_error = '✖'
endif
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

