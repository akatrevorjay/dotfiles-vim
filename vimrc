" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


"filetype off
syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
"set ofu=syntaxcomplete#Complete

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" NeoBundle {{{

"let g:neobundle#types#git#default_protocol = 'git'

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Use neobundle standard recipes.
NeoBundle 'Shougo/neobundle-vim-recipes'

" Support local bundles
NeoBundleLocal $HOME.'/.vim/bundle-local'

" UI
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/promptline.vim'

" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

" Productivity
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'chrisbra/Recover.vim'
"NeoBundle 'thinca/vim-prettyprint'
"NeoBundle 'tpope/vim-speeddating'
"NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe', {
\    'build' : {
\        'unix': './install.sh --clang-completer --omnisharp-completer --system-libclang',
\        'osx': './install.sh',
\    },
\ }
"NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/Rainbow-Parentheses-Improved'
NeoBundle 'vim-scripts/trailing-whitespace'
NeoBundle 'xolox/vim-misc'

NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle 'Shougo/unite.vim', {'recipe' : 'unite'}

NeoBundle 'scrooloose/syntastic'
"NeoBundle 'rstacruz/sparkup', {'rtp' : 'vim'}
"NeoBundle 'Raimondi/delimitMate'
"NeoBundle 'jeetsukumaran/vim-buffergator'
"NeoBundle 'joonty/vdebug'
"NeoBundle "mattn/emmet-vim"  " Previously known as zencoding

" Notes
NeoBundle 'xolox/vim-notes'
NeoBundle 'jceb/vim-orgmode'

" Syntax
NeoBundle 'saltstack/salt-vim'
NeoBundle 'veselosky/vim-rst'
"NeoBundle 'nvie/vim-rst-tables'
"NeoBundle 'jtriley/vim-rst-headings'
NeoBundle 'vim-scripts/ciscoasa.vim'
NeoBundle 'wlangstroth/vim-haskell'
NeoBundle 'leshill/vim-json'
NeoBundle 'juvenn/mustache.vim'
"NeoBundle 'tpope/vim-markdown'
NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'chrisbra/csv.vim'
NeoBundle 'ekalinin/Dockerfile.vim'

" Python, oh python
NeoBundle 'klen/python-mode'

" Approximately converts gui only colorschemes to console
NeoBundle 'godlygeek/csapprox'

" Dash doc viewer
NeoBundle 'rizzatti/dash.vim'

" Colors
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'vim-scripts/tropikos'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/badwolf'
NeoBundle 'Pychimp/vim-luna'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'trapd00r/neverland-vim-theme'
NeoBundle 'noahfrederick/Hemisu'
NeoBundle 'zaiste/Atom'

call neobundle#end()

" Required:
"filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" }}}


" Jump to the last position when reopening a file {{{
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif
" }}}

" Misc/search/highlight/nu/gui/invisibles {{{
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" Dont copy indent from current line when starting a new line
set cindent

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Ignore case in file searches
set ic
" .. Except when we use any upper case in the pattern
set scs

" Highlight all results of search
set hlsearch
" Ctrl-L clears the highlight from the last search
noremap <C-l> :nohlsearch<CR><C-l>
noremap! <C-l> <ESC>:nohlsearch<CR><C-l>

" Stupid hack for qtile not telling gvim to redraw
nmap r :redraw!<cr>

" Highlight the line the cursor is on (local to window)
set cul

" Suedit
function Suedit()
  let fname=tempname()
  exe 'w '.fname
  let owner=system('stat -c%U:%G '.expand("%"))
  let modes=system('stat -c%a '.expand("%"))
  exec '!sudo cp '.fname.' '.expand("%")
  exec '!sudo chmod '.modes." ".expand("%")
  exec '!sudo chown '.owner'" ".expand("%")
endfunction

"
" Smart in-line manpages with 'K' in command mode
" ~trevorj 061112 no longer needed using symlinked ftplugin/man.vim from
" vim installdir into plugin/ then using :Man func
"
fun! ReadMan()
  " Assign current word under cursor to a script variable:
  let s:man_word = expand('<cword>')
  " Open a new window:
  :wincmd n
  " Read in the manpage for man_word (col -b is for formatting):
  :exe ":r!man " . s:man_word . " | col -b"
  " Goto first line...
  :goto
  " and delete it:
  :delete
  " finally set file type to 'man':
  :set filetype=man
  " lines set to 20
  :resize 20
endfun
" Map the K key to the ReadMan function:
noremap K :call ReadMan()<CR>


" Other highlight options
"set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws

" set 7 lines to curors - when moving vertical
"set so=7

" show a report when N lines were changed. 0 means
" 'all' - always report
"set report=0

" make taglist hilight update faster
"set updatetime=200

" tab/buffer options
" useopen usetab split newtab
"set switchbuf=usetab,useopen,newtab

" Numbers
set number
set numberwidth=3

" Invisibles
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=tab:..

" }}}

" Spacing tabstops/indents {{{

" Indent width
set shiftwidth=4
" Tab width
set tabstop=4

" Number of spaces used for autoindent (local to buffer)
"set sw=4
" Clever autoindenting
"set si
" Indenting for C code
"set cin

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

" Let OS know when to flush disk
set nofsync

" write buffer when leaving
"set autowrite

" no backup/swap
"set nowb
"set nobackup
"set noswapfile

" autoread when a file is changed from the outside
"set autoread

" }}}


" Colors {{{
"
"" Syntax highlighting
set t_Co=256
set background=dark

"colorscheme elflord
"let g:zenburn_unified_CursorColumn=1
"colorscheme navajo-night
"colorscheme camo
"colorscheme carvedwood
"colorscheme evening
"colorscheme fruity
"colorscheme guardian
"colorscheme industrial
"colorscheme ir_black
"colorscheme bensday
"colorscheme lucius
"colorscheme xoria256
"colorscheme jellybeans
"colorscheme leo
"colorscheme earendel
"colorscheme inkpot
"colorscheme wombat256
"colorscheme BusyBee
"colorscheme darkspectrum
"colorscheme darkeclipse
"colorscheme slate
"colorscheme hemisu
"let g:zenburn_high_Contrast=1
"colorscheme zenburn
"colorscheme railscasts-trevorj
"colorscheme mustang
"colorscheme molokai
"let g:liquidcarbon_high_contrast = 1
"let g:hybrid_use_Xresources = 1
"colorscheme hybrid
"colorscheme herald_modified
colorscheme luna


" gvim
set guioptions=acMh
set mousefocus " focus follows mouse in gvim
if has("gui_running")
    "colorscheme railscasts-trevorj
    "colorscheme neverland-darker
    set clipboard=unnamedplus
    if has("gui_gtk2")
        set guifont=Menlo\ for\ Powerline\ 16
        set guifontwide=Menlo\ for\ Powerline\ 16
        "set guifont=Monaco\ for\ Powerline\ 16
        "set guifont=ProFontWindows\ 12
    "elseif has("gui_photon")
    "    set guifont=Menlo\ for\ Powerline:s12
    "elseif has("gui_kde")
    "    set guifont=Menlo\ for\ Powerline/12/-1/5/50/0/0/0/1/0
    ""elseif has("x12")
    ""    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    else
        set guifont=Menlo\ for\ Powerline:h12
    endif
endif

" }}}

" Tab completion options {{{

" Filetype specifics
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal completefunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set wildchar=<Tab>
set wildmenu
set wildmode=longest,list
"set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.bak,*.pyo,*.pyc,*.svn
"set complete=.,t

" YouCompleteMe
let g:ycm_complete_in_comments = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 0
"

" }}}

" Python-Mode {{{

" Load show documentation plugin
let g:pymode_doc = 1

" Key for show python documentation
let g:pymode_doc_key = '<leader>K'

" Load run code plugin
let g:pymode_run = 1

" Key for run python code
let g:pymode_run_key = '<leader>r'

" Load pylint code plugin
let g:pymode_lint = 1

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mccabe"
"let g:pymode_lint_checker = "pyflakes,pep8,pymetrics"
"let g:pymode_lint_checker = "flake8"
"let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_checker = "pyflakes"

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
let g:pymode_lint_ignore = "E501"

" Select errors and warnings
" E.g. "E4,W"
let g:pymode_lint_select = ""

" Run linter on the fly
let g:pymode_lint_onfly = 0

" Pylint configuration file
" If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"

" Check code every save
let g:pymode_lint_write = 1

" Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" Auto jump on first error
let g:pymode_lint_jump = 0

" Hold cursor in current window
" when quickfix is open
let g:pymode_lint_hold = 0

" Place error signs
let g:pymode_lint_signs = 1

" Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8

" Minimal height of pylint error window
let g:pymode_lint_minheight = 1

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 2



" Load rope plugin
let g:pymode_rope = 0

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 0

"let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_autoimport_modules = ["os.*", "shutil", "time", "datetime", "traceback", "django.*", "xml.etree", "flask.*"]
"imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 0

let g:pymode_rope_guess_project = 1

"let g:pymode_rope_goto_def_newwin = ""

"let g:pymode_rope_always_show_complete_menu = 0


" Enable python folding
let g:pymode_folding = 1


" Enable python objects and motion
let g:pymode_motion = 1


" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1


" Additional python paths
let g:pymode_paths = ['/opt/solarsan', '/opt/solarsan/solarsan', '~/Projects']

" Load breakpoints plugin
let g:pymode_breakpoint = 1

" Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'

" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" Enable pymode indentation
let g:pymode_indent = 1

" Set default pymode python options
let g:pymode_options = 1



" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" Highlight equal operator
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

" Highlight stars operator
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all

" Highlight `self`
let g:pymode_syntax_highlight_self = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0


" }}}


" mouse {{{

"set mouse=nvch " all modes but insert
set mouse=a
"set mouse= " mouse urges hatred in me
set mousemodel="extend" " popup popup_setpos

" }}}

" Syntastic {{{

"let g:syntastic_enable_balloons = 1
"let g:syntastic_check_on_open = 1
""let g:syntastic_python_checker_args = ""
""let g:syntastic_auto_jump = 1
"let g:syntastic_auto_loc_list = 1
""let g:syntastic_enable_highlighting = 0
"let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
""let g:syntastic_mode_map = {}
""let g:syntastic_quiet_warnings = 1
""let g:syntastic_loc_list_height = 10

" }}}

"" ropevim {{{

"let g:ropevim_vim_completion = 1
"let g:ropevim_extended_complete = 1

" }}}

" Keys {{{

" Quick vim commands
nnoremap ; :

" Quick paste
nnoremap <c-v><c-v> i<leader><tab><c-r>+<leader><tab><Esc>
inoremap <c-v><c-v> <leader><tab><c-r>+<leader><tab>
"nnoremap <c-v><c-c> i<c-r>+<Esc>
"inoremap <c-v><c-c> <c-r>+

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Paste
set pastetoggle=<leader><tab>
"set pastetoggle=<F3>
map <F3> <leader><tab>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Move around windows easier
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Fix arrows in screen
"map ^[OC <Right>
"map ^[OD <Left>
"map ^[[C <S-Right>
"map ^[[D <S-Left>

" Allow move around using ctrl+arrows
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
noremap <silent> <C-F12> :bd!<CR>


" NERDTree Toggle
"map <Leader>t :NERDTreeToggle<CR>

" MakeGreen defaults to \t
map <Leader>] <Plug>MakeGreen

" TaskList defaults to \t
map <leader>v <Plug>TaskList
map <leader>td <Plug>TaskList

" MiniBufExplorer Toggle default is \mbe
"map <Leader>b :TMiniBufExplorer<cr>
"map <Leader>b :let g:miniBufExplSplitBelow=0<cr>:let g:miniBufExplVSplit=0<cr>:TMiniBufExplorer<cr>
"map <Leader>] :let g:miniBufExplSplitBelow=1<cr>:let g:miniBufExplVSplit=1<cr>:TMiniBufExplorer<cr>

" Ack (! means do not open the first file automagically)
"nmap <leader>a <Esc>:Ack!

" Gundo
map <Leader>u :GundoToggle<cr>

" Rope
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

" YouCompleteMe
"map <leader>j :YcmCompleter GotoDefinition
"map <leader>d :YcmCompleter GotoDeclaration
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" CommandT
"nmap <leader>` :CommandT<CR>
"nmap <leader><leader>` :CommandTBuffer<CR>

" Quit
map q :q<cr>
map Q :q!<cr>
map W :wq<cr>

" django-nose test runner
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" Py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Toggle line numbers and foldcol
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


" }}}

" Folding {{{
set foldenable
"set foldmethod=marker
set foldmarker={{{,}}}
set foldcolumn=2
"set foldnestmax=2
set foldmethod=indent
set foldlevel=1
set shiftround                          " Indent/outdent to nearest tabstops

"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif
"augroup END

" Use space to toggle folding
"nnoremap <space> za
"vnoremap <space> zf
" OR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" }}}


" Toggle quickfix
noremap <silent> <F4> :QFix<CR>
" Code complete
"inoremap <Nul> <C-x><C-o>

" remove trailing whitespace
"autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"the quickfix window is not always 10 lines height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"quickfix toogle
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    let g:pylint_cwindow = 0
    unlet g:qfix_win
  else
    copen 10
    call AdjustWindowHeight(3, 10)
    let g:pylint_cwindow = 1
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Highlight columns over 80
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30


" vim-haskell
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "xdg-open"

" Color column @ cols=80
set cc=80
"hi ColorColumn ctermbg=lightblue guibg=lightblue

" Tagbar settings
"let g:tagbar_left = 1

" When using set list:
"set lcs=tab:▒░
"set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
" testing tabs 	 	 	 	 	 	 	 test

"if $LANG =~ ".*\.UTF-8$" || $LANG =~ ".*utf8$" || $LANG =~ ".*utf-8$"
    set listchars+=tab:»·,trail:·,precedes:…,extends:…
"else
"    set listchars=tab:>-,trail:-
"endif

" Plugin Options {{{1

" CtrlP
" Specific ignore for DVCS/VCS
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.pyc$'
"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 1
map <leader>B :CtrlPBuffer<cr>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" TaskList
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']

" Ack (grep replacement)
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" NERDtree {{{
"autocmd vimenter * NERDTree
" Add NERDtree by default on new vim runs without any args
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" misc
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
"let NERDTreeStatusline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
" }}}

" vim-notes
let g:notes_directories = ["~/Notes"]

" Airline {{{

set encoding=utf-8
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

let g:airline_powerline_fonts = 1

" Promptline
"let g:promptline_preset = 'full'
let g:promptline_preset = {
    \'a': [ promptline#slices#host(), promptline#slices#user(), promptline#slices#python_virtualenv() ],
    \'b': [ promptline#slices#cwd() ],
    \'c' : [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)' ],
    \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}

"    \'z' : [ promptline#slices#python_virtualenv() ],

" Optional extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" TODO Are these automatically enabled or not?
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#csv#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#promptline#enabled = 1
"let g:airline#extensions#promptline#snapshot_file = $HOME.'/.bash/themes/airline.sh'

" }}}

" Indent guides {{{

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=100
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=40
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" }}}

"" NotMuch (notmuch-ruby)
let g:notmuch_sendmail = 'sendmail'

let g:notmuch_rb_custom_search_maps = {
    \ 't':      'search_tag("+to-do -inbox")',
    \ }

let g:notmuch_rb_custom_show_maps = {
    \ 't':      'show_tag("+to-do -inbox")',
    \ }

" Mutt
"let g:qcc_query_command='abook'
let g:qcc_query_command='goobook query'
au BufRead /tmp/mutt* :source ~/.vim/mail.vim | :source ~/.vim/mail-goobook.vim | setlocal omnifunc=QueryCommandComplete
