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

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

" Note: Skip initialization for vim-tiny or vim-small.
"if !1 | finish | endif
if 0 | endif


" }}}

" NeoVim {{{
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
" }}}

" Plug {{{

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
    " filetype off                   " Supposedly this is needed for vundle and other plugin managers
  endif

  "set runtimepath^=~/.vim/bundle/neobundle.vim/
endif

" Required:
call plug#begin('~/.vim/plugger')

" Support local bundles
"Plug expand('~/.vim/bundle-local')
"Plug expand('~/.vim/bundle-local/fzf')

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" Syntax checks
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

"" Python, oh python
" Do not load vim-pyenv until *.py is opened and
" make sure that it is loaded after jedi-vim is loaded.
Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv', {'for': ['python', 'python3']}

"" BATS test runner and syntax
Plug 'markcornick/vim-bats', {'for': ['bats', 'sh', 'bash', 'shell', 'zsh']}

"" Productivity
" Plug 'kien/ctrlp.vim'  ", {'on': 'CtrlP' }
Plug 'ctrlpvim/ctrlp.vim'  " active fork

Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'

"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'majutsushi/tagbar' ", { 'on': ['TagbarToggle', 'Tagbar'] }
Plug 'sjl/gundo.vim', {'on': 'Gundo' }
Plug 'chrisbra/Recover.vim'
Plug 'vim-scripts/trailing-whitespace'

"" Vetting
Plug 'vim-scripts/mru.vim'
"Plug 'vim-scripts/Rainbow-Parentheses-Improved'
"Plug 'xolox/vim-misc'
"Plug 'thinca/vim-prettyprint'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-surround'
"Plug 'farseer90718/vim-taskwarrior'
"Plug 'bling/vim-bufferline'
"Plug 'MarcWeber/vim-addon-signs'
Plug 'tomtom/quickfixsigns_vim'

"Plug 'rstacruz/sparkup', {'rtp' : 'vim'}
"Plug 'Raimondi/delimitMate'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'joonty/vdebug'
"Plug 'mattn/emmet-vim'  " Previously known as zencoding

" Notes
"Plug 'xolox/vim-notes'
"Plug 'jceb/vim-orgmode'

"" Stuff I never used
" Use neobundle standard recipes.
"Plug 'Shougo/neobundle-vim-recipes', {'force': 1}
"Plug 'Shougo/vimproc', {
"\ 'build' : {
"\     'windows' : 'make -f make_mingw32.mak',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make -f make_mac.mak',
"\     'unix' : 'make -f make_unix.mak',
"\    },
"\ }
"Plug 'Shougo/unite.vim', {'recipe' : 'unite'}
"Plug 'Shougo/neomru.vim'

" Syntax
Plug 'saltstack/salt-vim', { 'for': 'sls' }
Plug 'fatih/vim-go', {'for': 'go'}

"Plug 'ingydotnet/yaml-vim'
"Plug 'veselosky/vim-rst'
"Plug 'nvie/vim-rst-tables'
"Plug 'jtriley/vim-rst-headings'
"Plug 'vim-scripts/ciscoasa.vim'
"Plug 'wlangstroth/vim-haskell'
"Plug 'leshill/vim-json'
"Plug 'juvenn/mustache.vim'
"Plug 'tpope/vim-markdown'
Plug 'plasticboy/vim-markdown', {'for': ['mkd', 'md', 'markdown']}

"Plug 'chrisbra/csv.vim'
"Plug 'ekalinin/Dockerfile.vim'

" Dash doc viewer
"Plug 'rizzatti/dash.vim'

" Todo.txt
"Plug 'freitass/todo.txt-vim.git'



" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" github dash?
Plug 'junegunn/vim-github-dashboard'

"" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

"" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', {
\   'dir': expand('~/.shell/repos/fzf'),
\   'do': './install --bin',
\ }

"" Unmanaged plugin (manually installed and updated)
"Plug '~/.vim/bundle-local/fzf'



"" UI
Plug 'bling/vim-airline'
\ | Plug 'edkolev/promptline.vim'
\ | Plug 'ryanoasis/vim-devicons'  " Pretty iconize everything

" Approximately converts gui only colorschemes to console
Plug 'godlygeek/csapprox'

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/tropikos'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/badwolf'
Plug 'Pychimp/vim-luna'
Plug 'jonathanfilip/vim-lucius'
Plug 'trapd00r/neverland-vim-theme'
Plug 'noahfrederick/Hemisu'
Plug 'zaiste/Atom'
Plug 'ratazzi/blackboard.vim'
Plug 'effkay/argonaut.vim'
Plug 'jedverity/feral-vim'
Plug 'stephanedemotte/beekai'
" Plug 'marcopaganini/mojave-vim-theme'
Plug 'trevorrjohn/vim-obsidian'
Plug 'mhartington/oceanic-next'



""
"" Finish up plugins
""

" Add plugins to &runtimepath
call plug#end()

if has('vim_starting')
    " Required:
    filetype plugin indent on
endif

"" If there are uninstalled bundles found on startup,
"" this will conveniently prompt you to install them.
"PlugInstall


" }}}


" Jump to the last position when reopening a file {{{
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif

  """ Mark last pos with vim-addon-signs
  "sign define cursor_location text=-
  "augroup TRACK_LAST_CURSOR_POS_FOR_EACH_WINDOW
  "  au!
  "  autocmd CursorHold,CursorHoldI,CursorMoved,CursorMovedI *
  "    \   let b:last_cursor_pos = [bufnr('%'), line('.'), 'cursor_location']
  "    \ | call vim_addon_signs#Push("last_cursor_pos", map(filter(range(1, bufnr('$')), 'bufexists(v:val) && has_key(getbufvar(v:val,""),"last_cursor_pos")'), 'getbufvar(v:val, "last_cursor_pos")' ))
  "augroup end
  "
  """ Add a dummy sign so that the left column showing the signs is always present:
  "" can't use an opaque sign :-(
  "sign define dummy text=.
  "augroup TRACK_LAST_CURSOR_POS_FOR_EACH_WINDOW
  "  au!
  "  autocmd BufNew * call vim_addon_signs#Push("dummy", map(filter(range(1, bufnr('$')), 'bufexists(v:val)'), '[v:val, 1, "dummy"]' ))
  "augroup end
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
"set cindent

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
"nmap r :redraw!<cr>

" Highlight the line the cursor is on (local to window)
set cul

""
"" Smart in-line manpages with 'K' in command mode
"" ~trevorj 061112 no longer needed using symlinked ftplugin/man.vim from
"" vim installdir into plugin/ then using :Man func
""
"fun! ReadMan()
"  " Assign current word under cursor to a script variable:
"  let s:man_word = expand('<cword>')
"  " Open a new window:
"  :wincmd n
"  " Read in the manpage for man_word (col -b is for formatting):
"  :exe ":r!man " . s:man_word . " | col -b"
"  " Goto first line...
"  :goto
"  " and delete it:
"  :delete
"  " finally set file type to 'man':
"  :set filetype=man
"  " lines set to 20
"  :resize 20
"endfun
"" Map the K key to the ReadMan function:
"noremap K :call ReadMan()<CR>


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

" When using set list:
"set lcs=tab:▒░
"set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
" testing tabs 	 	 	 	 	 	 	 test

"if $LANG =~ ".*\.UTF-8$" || $LANG =~ ".*utf8$" || $LANG =~ ".*utf-8$"
    set listchars+=tab:»·,trail:·,precedes:…,extends:…
"else
"    set listchars=tab:>-,trail:-
"endif

" Color column @ cols=80
set cc=120
"hi ColorColumn ctermbg=lightblue guibg=lightblue

" Highlight columns over 80
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

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
"let g:liquidcarbon_high_contrast = 1
"let g:hybrid_use_Xresources = 1
"colorscheme hybrid
"colorscheme herald_modified
"colorscheme luna
"colorscheme molokai
colorscheme OceanicNext

let g:airline_theme = 'oceanicnext'


" gvim
set guioptions=acMh
set mousefocus " focus follows mouse in gvim
if has("gui_running")
    "colorscheme railscasts-trevorj
    "colorscheme neverland-darker

    " Dunno what this does? Integration into a specific OS buffer?
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
        "set guifont=Menlo\ for\ Powerline:h12
        set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14  " nerd font complete
    endif
endif

" }}}

" Tab completion options {{{
set wildchar=<Tab>
set wildmenu
"set wildmode=longest,list
"set wildmode=longest:full,list:longest,list:full
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.swo,*.bak,*.pyo,*.pyc,*.svn,*/tmp/*,__pycache__,sdist,bdist,dist,build,*.egg-info

"" Allow to use <S-Tab> for CTRL-P in an xterm:
"" > put in shrc: xmodmap -e "keysym Tab = Tab Find"
" cmap <Esc>[1~ <C-P>

"set complete=.,t
" }}}

" Jedi {{{
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1
" Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.
let g:jedi#show_call_signatures = "1"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>gg"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" vim-pyenv hook
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let major_version = pyenv#python#get_internal_major_version()
    call jedi#force_py_version(major_version)
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif
" }}}

"" YouCompleteMe {{{
""set completeopt-=preview
"let g:ycm_complete_in_comments = 1
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_collect_identifiers_from_tags_files = 1
""let g:ycm_collect_identifiers_from_comments_and_strings = 0
"" }}}

"" Filetype specifics {{{
set completefunc=syntaxcomplete#Complete  " ofu
"set omnifunc=syntaxcomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal completefunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

"" profiling {{{
"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
"nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
"" }}}

" mouse {{{

"set mouse=nvch " all modes but insert
set mouse=a
"set mouse= " mouse urges hatred in me
set mousemodel="extend" " popup popup_setpos

" }}}

" Syntastic {{{

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_exec = '/usr/bin/env python'

let g:syntastic_python_checkers = ['flake8']

"let g:syntastic_enable_balloons = 1
"let g:syntastic_check_on_open = 1
""let g:syntastic_python_checker_args = ""
""let g:syntastic_auto_jump = 1
"let g:syntastic_auto_loc_list = 1
""let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_signs = 1
"let g:syntastic_echo_current_error = 1
""let g:syntastic_mode_map = {}
""let g:syntastic_quiet_warnings = 1
""let g:syntastic_loc_list_height = 10

" Syntastic-extras {{{2
" Like Syntastic's normal checker, but only checks files if there is a
" '.syntastic_c_config' file existing in the directory or an ancestor
" directory. It ignores warnings in included files by using '-isystem'
" instead of '-I'.
let g:syntastic_c_checkers = ['check']

" Like Syntastic's normal checker, but only checks files if there is a
" '.syntastic_cpp_config' file existing in the directory or an ancestor
" directory. It ignores warnings in included files by using '-isystem'
" instead of '-I'.
let g:syntastic_cpp_checkers = ['check']

let g:syntastic_cfg_checkers = ['cfg']
let g:syntastic_dosini_checkers = ['dosini']

let g:syntastic_make_checkers = ['gnumake']

let g:syntastic_javascript_checkers = ['json_tool']

let g:syntastic_gitcommit_checkers = ['language_check']
let g:syntastic_svn_checkers = ['language_check']

" Like Syntastic's pyflakes checker, but treats messages about unused
" variables/imports as warnings rather than errors.
"let g:syntastic_python_checkers = ['pyflakes_with_warnings']

let g:syntastic_yaml_checkers = ['pyyaml']

"" Block ZZ if there are syntax errors:
nnoremap ZZ :call syntastic_extras#quit_hook()<cr>
" 2}}}

" ropevim {{{
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
vmap <Leader>q gq
nmap <Leader>q gqap

" Paste
set pastetoggle=<leader><tab>
"set pastetoggle=<F3>
map <F3> <leader><tab>

" Quickly edit/reload the vimrc file
augroup reload_vimrc
    autocmd!
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC

    if exists("g:loaded_webdevicons")
        call webdevicons#refresh()
    endif
 
    if exists("g:loaded_airline")
        exec 'AirlineRefresh'
    endif
augroup END
"nmap <silent> <leader>rv augroup reload_vimrc<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

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

" Move around windows easier
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h



" NERDTree {{{
"
map <Leader>E :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" }}}


"" MakeGreen defaults to \t
"map <Leader>] <Plug>MakeGreen

"" TaskList defaults to \t
"map <leader>v <Plug>TaskList
"map <leader>td <Plug>TaskList

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

"" YouCompleteMe
"nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>g :YcmCompleter GoTo<CR>

" CommandT
"nmap <leader>` :CommandT<CR>
"nmap <leader><leader>` :CommandTBuffer<CR>

" Quit
map q :q<cr>
map Q :q!<cr>
map W :wq<cr>

"" django-nose test runner
"map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"" Py.test
"" Execute the tests
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

"" Toggle line numbers and foldcol
"nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


" }}}

" Folding {{{
set foldenable
""set foldmethod=marker
"set foldmarker={{{,}}}
"set foldcolumn=2
""set foldnestmax=2
set foldmethod=indent
"set foldlevel=1
"set shiftround                          " Indent/outdent to nearest tabstops

"" Vimrc files get to use marker folds
augroup vimrc
 au BufReadPre * setlocal foldmethod=indent
 au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif
augroup END

"" Use space to toggle folding
" nnoremap <space> za
" vnoremap <space> zf
"" OR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" }}}

" Code complete
"inoremap <Nul> <C-x><C-o>

" remove trailing whitespace
"autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"" Toggle quickfix {{{
noremap <silent> <F4> :QFix<CR>

"the quickfix window is not always 10 lines height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" quickfix toogler
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    "let g:pylint_cwindow = 0
    unlet g:qfix_win
  else
    copen 10
    call AdjustWindowHeight(3, 10)
    "let g:pylint_cwindow = 1
    let g:qfix_win = bufnr("$")
  endif
endfunction
"" }}}

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30
let g:tagbar_left = 1

" vim-haskell
" use ghc functionality for haskell files
"au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
"let g:haddock_browser = "xdg-open"

" Plugin Options {{{1

"" Ctrl-Space {{{
"set showtabline=0
"
""if has("gui_running")
""    " Settings for MacVim and Inconsolata font
""    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
""endif
"
"if executable("ag")
"    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
"endif
"
""let g:CtrlSpaceSearchTiming = 500
"
"nnoremap <silent><C-p> :CtrlSpace O<CR>
"
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"let g:CtrlSpaceSaveWorkspaceOnExit = 1
"" }}}


" CtrlP {{{

"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 100000
let g:ctrlp_lazy_update = 1
map <leader>B :CtrlPBuffer<cr>

" Specific ignore for DVCS/VCS
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.pyc$'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'setup.py', 'Dockerfile']

" ag is pretty nice, skips gitignore and all that jazz
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

" }}}

"" Unite
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

"" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
"  " Play nice with supertab
"  let b:SuperTabDisabled=1
"  " Enable navigation with control-j and control-k in insert mode
"  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction

" TaskList
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']

"" Ack (grep replacement)
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"" NERDtree {{{
""autocmd vimenter * NERDTree
"" Add NERDtree by default on new vim runs without any args
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""autocmd vimenter * if !argc() | NERDTree | endif
"" Close vim if NERDTree is the only window left open
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" misc
""let NERDTreeQuitOnOpen=1
"let NERDTreeShowBookmarks=1
""let NERDTreeStatusline=1
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1
"" }}}

" vim-notes
let g:notes_directories = ["~/Notes"]

" Airline {{{

if has('vim_starting')
    "" These are required by airline
    set encoding=utf8
    set laststatus=2 " Always display the statusline in all windows
    set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
endif

let g:airline_powerline_fonts = 1

" Optional extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" TODO Are these automatically enabled or not?
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#promptline#enabled = 1
let g:airline#extensions#promptline#snapshot_file = $HOME.'/.shell/themes/airline-snapshot.sh'

" }}}

" Devicons {{{
"let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
" }}}

" " Indent guides {{{
" "let g:indent_guides_auto_colors = 0
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=100
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=40
" "let g:indent_guides_enable_on_vim_startup = 1
" "let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" " }}}

" quickfixsigns {{{
noremap <silent> <leader><c-l> :call quickfixsigns#RelNumbersOnce()<cr>

let g:quickfixsigns_classes = ['loc', 'marks', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_aggregated_errors = 1
let g:quickfixsigns_sort_aggregated_errors = 1

" }}}

" 1}}}


