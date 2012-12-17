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

" pathogen {{{
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"call pathogen#infect()

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
"set ofu=syntaxcomplete#Complete

" }}}

" Syntax highlighting
set background=dark

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
"colorscheme elflord
set t_Co=256
let g:zenburn_high_Contrast=1
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
"colorscheme zenburn
"colorscheme railscasts-trevorj
"colorscheme mustang
colorscheme molokai

" gvim
set guioptions=acMh
set mousefocus " focus follows mouse in gvim
set guifont="Menlo for Powerline 12"
"set guifont="Monaco for Powerline 12"
"set guifont="ProFontWindows 12"
if has("gui_running")
    "colorscheme railscasts-trevorj
    "colorscheme neverland-darker
    if has("gui_gtk2")
        set guifont=Menlo\ for\ Powerline\ 12
    "elseif has("gui_photon")
    "    set guifont=Menlo\ for\ Powerline:s12
    "elseif has("gui_kde")
    "    set guifont=Menlo\ for\ Powerline/12/-1/5/50/0/0/0/1/0
    ""elseif has("x12")
    ""    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
    "else
    "    set guifont=Menlo_for_Powerline:h12:cDEFAULT
    endif
endif


" }}}

" Tab completion options {{{1
set wildchar=<Tab>
set wildmenu
set wildmode=longest,list
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.bak,*.pyo,*.pyc,*.svn
set complete=.,t



" Filetype specifics
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Python tab completion
""autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
""autocmd FileType python setlocal omnifunc=pysmell#Complete
""autocmd Filetype python set omnifunc=pysmell#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete

" Python stuffs
"autocmd filetype python source ~/.vim/python.vim

" Eclim
"let g:EclimPythonInterpreter = "python"
"let g:EclimDjangoAdmin= "django-admin.py"
"let g:EclimMenus = 1
""let g:EclimProjectProblemsUpdateOnSave = 1
"let g:EclimProjectTreeAutoOpen = 1
"let g:EclimPythonValidate = 1
""let g:EclimShowCurrentError = 1
""let g:EclimShowCurrentErrorBalloon = 1
""let g:EclimProjectTreeExpandPathOnOpen = 1
""let g:EclimProjectTreeSharedInstance = 1
""let g:EclimShowErrors = 1
""let g:EclimShowLoclistSigns = 1
""let g:EclimShowQuickfixSigns = 1
""let g:EclimMakeLCD = 1
""let g:EclimMakeQfFilter = 1
""let g:EclimTodoSearchExtensions = ['py', 'xml', 'html', 'css', 'js']
"let g:EclimTodoSearchExtensions = ['py', 'html']
"let g:EclimTodoSearchPattern = '\(\<fixme\>\|\<todo\>\|\<fuck\>\|\<wtf\>\)\c'
"nnoremap <silent> <buffer> <cr> :PythonSearchContext<cr>
"let g:EclimProjectStatusLine = 'eclim(p=${name}, n=${natures})'
"function! s:MyFind ()
"  let found = eclim#python#django#find#ContextFind()
"  if !found
"    PythonFindDefinition
"  endif
"endfunction
"nnoremap <silent> <buffer> <cr> :call <SID>MyFind()<cr>

function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &ft == 'python'
            return "\<M-/>"
        elseif &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>
""inoremap <buffer><Tab> <M-/>
""imap <buffer><Tab> <M-/>

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:SuperTabLongestEnhanced=1
"let g:SuperTabLongestHighlight=1
let g:SuperTabCrMapping=1
"let g:SuperTabClosePreviewOnPopupClose=1


let g:jedi#goto_command = "<leader>g"
let g:jedi#auto_initialization = 1
let g:jedi#get_definition_command = "<leader>d"
let g:jedi#pydoc = "K"
"let g:jedi#use_tabs_not_buffers = 0
let g:jedi#popup_on_dot = 1
let g:jedi#rename_command = "<leader>r"
let g:jedi#related_names_command = "<leader>n"


"autocmd FileType *
"    \ if &omnifunc != '' |
"    \   call SuperTabChain(&omnifunc, "<c-p>") |
"    \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
"    \ endif

"" Run pylint on save
""autocmd FileType python compiler pyflakes
""let g:pyflakes_use_quickfix = 1
""let g:pyflakes_use_quickfix = 0

" Python-Mode {{{

" Load show documentation plugin
let g:pymode_doc = 0

" Key for show python documentation
let g:pymode_doc_key = 'K'

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
let g:pymode_lint_checker = "pyflakes,pep8"

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
let g:pymode_lint_minheight = 3

" Maximal height of pylint error window
let g:pymode_lint_maxheight = 6



" Load rope plugin
let g:pymode_rope = 1

" Auto create and open ropeproject
let g:pymode_rope_auto_project = 1

" Enable autoimport
let g:pymode_rope_enable_autoimport = 1

" Auto generate global cache
let g:pymode_rope_autoimport_generate = 1

let g:pymode_rope_autoimport_underlineds = 0

let g:pymode_rope_codeassist_maxfixes = 10

let g:pymode_rope_sorted_completions = 1

let g:pymode_rope_extended_complete = 1

"let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_autoimport_modules = ["os.*", "shutil", "datetime", "traceback", "django.*", "xml.etree", "flask.*"]
"imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

let g:pymode_rope_confirm_saving = 1

let g:pymode_rope_global_prefix = "<C-x>p"

let g:pymode_rope_local_prefix = "<C-c>r"

let g:pymode_rope_vim_completion = 1

let g:pymode_rope_guess_project = 1

let g:pymode_rope_goto_def_newwin = ""

let g:pymode_rope_always_show_complete_menu = 0


" Enable python folding
let g:pymode_folding = 1


" Enable python objects and motion
let g:pymode_motion = 1


" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1


" Additional python paths
let g:pymode_paths = []

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

" For fast machines
let g:pymode_syntax_slow_sync = 0





" }}}


" mouse
"set mouse=nvch " all modes but insert
set mouse= " mouse urges hatred in me
set mousemodel="extend" " popup popup_setpos

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

""ropevim
"let g:ropevim_vim_completion = 1
"let g:ropevim_extended_complete = 1

" }}}1

" Keys {{{

" Quick vim commands
nnoremap ; :

" Quick paste
nnoremap <c-v><c-v> i<F3><c-r>+<F3><Esc>
inoremap <c-v><c-v> <F3><c-r>+<F3>
"nnoremap <c-v><c-c> i<c-r>+<Esc>
"inoremap <c-v><c-c> <c-r>+

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Paste
"set pastetoggle=<Leader>pt
set pastetoggle=<F3>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Move around windows easier
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
" Allow move around using ctrl+arrows
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
noremap <silent> <C-F12> :bd!<CR>


" NERDTree Toggle
map <Leader>t :NERDTreeToggle<CR>

" MakeGreen defaults to \t
map <Leader>] <Plug>MakeGreen

" TaskList defaults to \t
map <leader>v <Plug>TaskList
map <leader>td <Plug>TaskList

" MiniBufExplorer Toggle default is \mbe
map <Leader>b :TMiniBufExplorer<cr>
"map <Leader>b :let g:miniBufExplSplitBelow=0<cr>:let g:miniBufExplVSplit=0<cr>:TMiniBufExplorer<cr>
"map <Leader>] :let g:miniBufExplSplitBelow=1<cr>:let g:miniBufExplVSplit=1<cr>:TMiniBufExplorer<cr>

" Ack (! means do not open the first file automagically)
nmap <leader>a <Esc>:Ack!

" Gundo
map <Leader>u :GundoToggle<cr>

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" CommandT
nmap <leader>` :CommandT<CR>
nmap <leader><leader>` :CommandTBuffer<CR>

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

" Fix vim being run through a virtualenv {{{1
" Add the virtualenv's site-packages to vim path
py << EOF
#import os.path
#import sys
#import vim
#if 'VIRTUAL_ENV' in os.environ:
#    project_base_dir = os.environ['VIRTUAL_ENV']
#    sys.path.insert(0, project_base_dir)
#    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
#    execfile(activate_this, dict(__file__=activate_this))
EOF
" }}}1

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

" Pidgin
"nmap <F12> :Chat<CR>

" vim-haskell
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "xdg-open"

" Color column @ cols=80
"set cc=80
hi ColorColumn ctermbg=lightblue guibg=lightblue

" }}}

" Pidgin settings
"let g:python_pidgin_plugin_path='~/.vim/repos/vimpidgin-svn/src/pidgin_server.py'

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
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 0
let g:ctrlp_lazy_update = 1

" TaskList
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']

" Ack (grep replacement)
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" minibufexpl
"let g:miniBufExplMaxSize=20

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

" fugitive (git wrapper)
" No need for this with powerline ;)
"set statusline+=%{fugitive#statusline()}

" vim-notes
let g:notes_directory = "~/Notes"

" vimpy
"VimpyLoad ~/.vim/vimpy-projects.index

" Powerline {{{
set laststatus=2
set encoding=utf-8
"let Powerline_symbols="unicode"
let Powerline_symbols="fancy"
"let g:Powerline_colorscheme="skwp"

" New powerline alpha python
"python import plugin.vim.load_vim_plugin
" or
source $HOME/.vim/repos/powerline/plugin/vim/powerline.vim

" ConqueTerm
let g:ConqueTerm_Color = 1
"let g:ConqueTerm_SessionSupport = 0
"let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_ToggleKey = '<F10>'
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_FastMode = 1

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=100
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=40
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" }}}

"" NeoComplCache {{{
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 0
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }

"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""inoremap <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
""inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

"" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
""inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

"" Enable omni completion.
""autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
""autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
""autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
""autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"" UltiSnips
""does not work with these snippets...
""let g:UltiSnipsSnippetDirectories=['UltiSnips', '/home/trevorj/.vim/snippets']
"" }}}

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

"" BufSel
"function! BufSel(pattern)
"  let bufcount = bufnr("$")
"  let currbufnr = 1
"  let nummatches = 0
"  let firstmatchingbufnr = 0
"  while currbufnr <= bufcount
"    if(bufexists(currbufnr))
"      let currbufname = bufname(currbufnr)
"      if(match(currbufname, a:pattern) > -1)
"        echo currbufnr . ": ". bufname(currbufnr)
"        let nummatches += 1
"        let firstmatchingbufnr = currbufnr
"      endif
"    endif
"    let currbufnr = currbufnr + 1
"  endwhile
"  if(nummatches == 1)
"    execute ":buffer ". firstmatchingbufnr
"  elseif(nummatches > 1)
"    let desiredbufnr = input("Enter buffer number: ")
"    if(strlen(desiredbufnr) != 0)
"      execute ":buffer ". desiredbufnr
"    endif
"  else
"    echo "No matching buffers"
"  endif
"endfunction

""Bind the BufSel() function to a user-command
"command! -nargs=1 Bs :call BufSel("<args>")
"nnoremap <Leader>o :Bs<Space>

" }}}1

