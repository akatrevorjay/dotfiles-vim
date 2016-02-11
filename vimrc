" Debian defaults {{{

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
" }}}

" Init {{{
"" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
      set nocompatible      " Be iMproved
    endif

    "set runtimepath^=~/.vim/repos/vim-plug/

    runtime! starting.vim
    if has('nvim')
      runtime! starting.nvim
    endif
endif
" }}}

" Bundles {{{
call plug#begin('~/.vim/plugger')

" Source bundles.vim
runtime! bundles.vim local/bundles.vim

" Add plugins to &runtimepath
call plug#end()

if has('vim_starting')
    "" If there are uninstalled bundles found on startup,
    "" this will conveniently prompt you to install them,
    "" at the cost of your time.
    "PlugInstall

    runtime! startup.vim
    if has('nvim')
      runtime! startup.nvim
    endif
endif

" NeoVim
runtime! pre.vim
if has('nvim')
    runtime! pre.nvim
endif
" }}}

" Basic setup (misc/search/highlight/nu/gui/invisibles) {{{
set showcmd            " Show (partial) command in status line.
set showmatch        " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase        " Do smart case matching
set incsearch        " Incremental search
set autowrite        " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes) in terminals

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
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=tab:..

" When using set list:
"set lcs=tab:▒░
"set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
" testing tabs									test

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


" Vim variance (console/gvim/macvim) setup {{{1
" GVim {{{
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

" Console vim {{{
"set mouse=nvch " all modes but insert
set mouse=a
"set mouse= " mouse urges hatred in me
set mousemodel="extend" " popup popup_setpos
" }}}

" 1}}}

"" Vim Profiler {{{
"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
"nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
"" }}}

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

" UI {{{1

"" 256 color mode, ofc
set t_Co=256
set background=dark

" Colorschemes {{{
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

" }}}

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
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
" }}}

" quickfixsigns {{{
noremap <silent> <leader><c-l> :call quickfixsigns#RelNumbersOnce()<cr>

" No fucking flags. Nobody likes fucking flag bitmaps.
let g:quickfixsigns_classes = ['loc', 'marks', 'vcsdiff', 'breakpoints']
let g:quickfixsigns_aggregated_errors = 1
let g:quickfixsigns_sort_aggregated_errors = 1
" }}}

" 1}}}

" Wild completion options {{{
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

" Completion {{{
"set completefunc=syntaxcomplete#Complete
"set omnifunc=syntaxcomplete#Complete

" Python omni is handled by Jedi <3
""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal completefunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" }}}

" Python {{{1

" Completion: Jedi {{{2
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1
" Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.
"let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures = "2"  " show in cmdline
let g:jedi#show_call_signatures_delay = 250  " ms (500)
let g:jedi#max_doc_height = 30
"let g:jedi#auto_close_doc = 0
let g:jedi#squelch_py_warning = 1

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>gg"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

"" vim-pyenv hook to switch major python versions automagically
"if has('python') or has('python3')
if has('python3')
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
endif

" 2}}}

" Rope {{{2
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"let g:ropevim_vim_completion = 1
"let g:ropevim_extended_complete = 1
" 2}}}

" 1}}}

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

" }}}

" Tools and utilities  {{{

" Jump to the last position when reopening a file {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
if has("autocmd")
  autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

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

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

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

" Folding {{{
set foldenable
""set foldmethod=marker
"set foldmarker={{{,}}}
"set foldcolumn=2
""set foldnestmax=2
set foldmethod=indent
set foldlevel=1
set shiftround                          " Indent/outdent to nearest tabstops

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
noremap <silent> <Leader>f :QFix<CR>
"noremap <silent> <Leader>qf :QFix<CR>

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

"" Plugin options {{{2

" NERDTree {{{
"
map <Leader>E :NERDTreeToggle<CR>

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

" NERDTress File highlighting {{{2
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
" 2}}}


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

" CtrlP {{{
map <leader>3 :CtrlPBufTag<cr>
map <leader># :CtrlPBufTagAll<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>B :CtrlPBuffer<cr>
"map <leader>u :CtrlPUndo<cr>
map <leader>u :CtrlPChange<cr>
map <leader>mru :CtrlPMRUFiles<cr>
map <leader>` :suspend<cr>

"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 100000
let g:ctrlp_lazy_update = 1
let g:ctrlp_regexp_search = 1

"let g:ctrlp_tilde_homedir = 1

let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'setup.py', 'Dockerfile', 'package.json']
" ag is pretty nice, skips gitignore and all that jazz
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

" Specific ignore for DVCS/VCS
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.pyc$'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30
"let g:tagbar_left = 1
"let g:tagbar_vertical = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 0
let g:tagbar_compact = 0
"let g:tagbar_indent = 2
let g:tagbar_show_linenumbers = 1
let g:tagbar_singleclick = 1
" }}}

"" vim-haskell {{{
"" use ghc functionality for haskell files
""au Bufenter *.hs compiler ghc
""
"" configure browser for haskell_doc.vim
""let g:haddock_browser = "xdg-open"
"" }}}

" TaskList
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']

"" Ack (grep replacement)
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" vim-notes
let g:notes_directories = ["~/Notes"]


" Only set indent when no other was loaded.
if !exists("b:did_indent")
  set smartindent
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif


"" Vim
"let g:indentLine_color_term = 239

""GVim
"let g:indentLine_color_gui = '#A4E57E'

"" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

"let g:indentLine_concealcursor = 'vc' "(default 'inc')
"let g:indentLine_conceallevel = 0  "(default 2)


"" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'



" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


let g:oblique#incsearch_highlight_all=1
"autocmd! User Oblique       normal! zz
"autocmd! User ObliqueStar   normal! zz
"autocmd! User ObliqueRepeat normal! zz


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>rt <Plug>(go-run-tab)
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)

let g:go_term_mode = "split"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }



let g:startify_bookmarks = [ {'v': '~/.vimrc'}, '~/.zshrc' ]

" vim -S mysession.vim
" If Session.vim exists in curdir, load it baby.
let g:startify_session_autoload = 1

" Automatically update sessions in two cases:
let g:startify_session_persistence = 1

let g:startify_change_to_vcs_root = 1

"let g:startify_session_savevars = [
"        \ 'g:startify_session_savevars',
"        \ 'g:startify_session_savecmds',
"        \ 'g:random_plugin_use_feature'
"        \ ]

let g:startify_custom_header =
      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

let g:startify_relative_path = 1

" Probs with ctrlp
autocmd User Startified setlocal buftype=
let g:ctrlp_reuse_window = 'startify'



" Author's config
autocmd User Startified setlocal cursorline

let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

"let g:startify_list_order = [
"    \ ['   LRU:'],
"    \ 'files',
"    \ ['   LRU within this dir:'],
"    \ 'dir',
"    \ ['   Sessions:'],
"    \ 'sessions',
"    \ ['   Bookmarks:'],
"    \ 'bookmarks',
"    \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ 'bundle/.*/doc',
            \ '/data/repo/neovim/runtime/doc',
            \ '/Users/mhi/local/vim/share/vim/vim74/doc',
            \ ]

let g:startify_bookmarks = [
            \ { 'v': '~/.vim/vimrc' },
            \ { 't': '/tmp' },
            \ { 'p' : expand('~/vk/git/proxy')},
            \ expand('~/vk/git/proxy/libs/vkconf'),
            \ ]

"let g:startify_custom_footer =
"        \ ['', "   Vim is charityware. Please read ':help uganda'.", '']


hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240



let g:NERDCustomDelimiters = {
            \ 'yaml': { 'left': '#'},
            \}



let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list = [{"path" : "~/docs/wiki"}]
nmap <Leader>wv <Plug>VimwikiIndex





" Post event
runtime! post.vim
" NeoVim
if has('nvim')
    "set lazyredraw
    runtime! post.nvim
endif

