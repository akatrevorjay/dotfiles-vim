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
colorscheme zenburn
"colorscheme railscasts-trevorj

" gvim
set guioptions=acMh
set mousefocus " focus follows mouse in gvim
set guifont="Monaco for Powerline 10"
if has("gui_running")
    "colorscheme railscasts-trevorj
endif


" }}}

" Tab completion options {{{1
set wildmode=longest,list
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.bak
"set complete=.,t


" Filetype specifics
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Python tab completion
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
"autocmd FileType python setlocal omnifunc=pysmell#Complete
"au Filetype python set omnifunc=pysmell#Complete
"au FileType python set omnifunc=pythoncomplete#Complete

" Eclim
let g:EclimPythonInterpreter = "python"
let g:EclimDjangoAdmin= "django-admin.py"
let g:EclimMenus = 1
"let g:EclimProjectProblemsUpdateOnSave = 1
let g:EclimProjectTreeAutoOpen = 1
let g:EclimPythonValidate = 1
"let g:EclimShowCurrentError = 1
"let g:EclimShowCurrentErrorBalloon = 1
"let g:EclimProjectTreeExpandPathOnOpen = 1
"let g:EclimProjectTreeSharedInstance = 1
"let g:EclimShowErrors = 1
"let g:EclimShowLoclistSigns = 1
"let g:EclimShowQuickfixSigns = 1
"let g:EclimMakeLCD = 1
"let g:EclimMakeQfFilter = 1
"let g:EclimTodoSearchExtensions = ['py', 'xml', 'html', 'css', 'js']
let g:EclimTodoSearchExtensions = ['py', 'html']
let g:EclimTodoSearchPattern = '\(\<fixme\>\|\<todo\>\|\<fuck\>\|\<wtf\>\)\c'
nnoremap <silent> <buffer> <cr> :PythonSearchContext<cr>
let g:EclimProjectStatusLine = 'eclim(p=${name}, n=${natures})'
function! s:MyFind ()
  let found = eclim#python#django#find#ContextFind()
  if !found
    PythonFindDefinition
  endif
endfunction
nnoremap <silent> <buffer> <cr> :call <SID>MyFind()<cr>

"function! SuperCleverTab()
"    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"        return "\"
"    else
"        if &omnifunc != ''
"            return "\\"
"        elseif &dictionary != ''
"            return "\"
"        else
"            return "\"
"        endif
"    endif
"endfunction

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
let g:SuperTabLongestEnhanced=1
"let g:SuperTabLongestHighlight=1
"let g:SuperTabCrMapping=1

" Run pylint on save
"autocmd FileType python compiler pylint
"let g:pyflakes_use_quickfix = 1

" mouse
"set mouse=nvch " all modes but insert
set mouse= " mouse urges hatred in me
set mousemodel="extend" " popup popup_setpos

let g:syntastic_enable_balloons = 1
let g:syntastic_check_on_open = 1
"let g:syntastic_python_checker_args = ""
"let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
"let g:syntastic_mode_map = {}
"let g:syntastic_quiet_warnings = 1
"let g:syntastic_loc_list_height = 10

"ropevim
let g:ropevim_vim_completion = 1
let g:ropevim_extended_complete = 1
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1

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
map <Leader>d :NERDTreeToggle<CR>

" MakeGreen defaults to \t
map <Leader>] <Plug>MakeGreen

" TaskList defaults to \t
map <leader>v <Plug>TaskList

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
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
" }}}1

" Folding {{{
set foldenable
"set foldmethod=marker
set foldmarker={{{,}}}
set foldcolumn=2
"set foldnestmax=2
set foldmethod=indent
set foldlevel=2

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
nmap <F12> :Chat<CR>

" vim-haskell
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "xdg-open"


" }}}

" Pidgin settings
let g:python_pidgin_plugin_path='~/.vim/repos/vimpidgin-svn/src/pidgin_server.py'

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

" }}}1

