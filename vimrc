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

  "set runtimepath^=~/.vim/bundles-local/dein.vim/

  runtime! starting.vim
  if has('nvim')
    runtime! starting.nvim
  endif
endif
" }}}

" Bundles {{{
call plug#begin('~/.vim/plugger')
"call dein#begin(expand('~/.cache/dein'))


" Source bundles.vim
runtime! bundles.vim local/bundles.vim
if has('nvim')
  runtime! bundles.nvim local/bundles.nvim
endif

" Add plugins to &runtimepath
call plug#end()

if has('vim_starting')
  "" If there are uninstalled bundles found on startup,
  "" this will conveniently prompt you to install them,
  "" at the cost of your time.
  "PlugInstall
endif

runtime! startup.vim
if has('nvim')
  runtime! startup.nvim
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
"set updatetime=250

" tab/buffer options
" useopen usetab split newtab
"set switchbuf=usetab,useopen,newtab

" Numbers
set number
set numberwidth=1

" Invisibles
"set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=tab:..

" When using set list:
"set lcs=tab:▒░
"set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
" testing tabs                  test

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

" Spacing tabstops/indents {{{

" Indent width
set shiftwidth=2
" Tab width
set tabstop=2
set softtabstop=2
set showtabline=2

" Number of spaces used for autoindent (local to buffer)
"set sw=4
" Clever autoindenting
"set si
" Indenting for C code
"set cin

" Spaces instead of tabs
set expandtab

" Always set auto indenting on
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
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
else
  set t_Co=256
endif

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
"colorscheme OceanicNext
colorscheme triplejelly
let g:airline_theme = 'oceanicnext'

"let g:triplejelly_background_color = '000000'
let g:triplejelly_background_color_256 = '000000'
"let g:triplejelly_foreground_color = 'C6CFD2'  " Default
let g:triplejelly_foreground_color = 'A7B7C7'
"let g:triplejelly_background_color = '000'
augroup ColorScheme
  au! *
  "highlight Comment guibg=#323230 guifg=#9999aa
  highlight Comment guibg=#252525 guifg=#9999aa
  highlight Identifier guibg=#121255
  highlight String guibg=#331133
augroup END

" Don't fuck with existing spacing unless we have to.
set preserveindent
set rnu

""au! CursorHold *.[ch] nested exe "silent! ptag " . expand("<cword>")
"au! CursorHold *.[ch] nested call PreviewWord()
"func! PreviewWord()
"  if &previewwindow			" don't do this in the preview window
"    return
"  endif
"  let w = expand("<cword>")		" get the word under cursor
"  if w =~ '\a'			" if the word contains a letter

"    " Delete any existing highlight before showing another tag
"    silent! wincmd P			" jump to preview window
"    if &previewwindow			" if we really get there...
"      match none			" delete existing highlight
"      wincmd p			" back to old window
"    endif

"    " Try displaying a matching tag for the word under the cursor
"    try
"      exe "ptag " . w
"    catch
"      return
"    endtry

"    silent! wincmd P			" jump to preview window
"    if &previewwindow		" if we really get there...
"      if has("folding")
"        silent! .foldopen		" don't want a closed fold
"      endif
"      call search("$", "b")		" to end of previous line
"      let w = substitute(w, '\\', '\\\\', "")
"      call search('\<\V' . w . '\>')	" position cursor on match
"      " Add a match highlight to the word at this position
"      hi previewWord term=bold ctermbg=green guibg=green
"      exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
"      wincmd p			" back to old window
"    endif
"  endif
"endfun

" }}}
"omg = 'test' + ' whoa' + "yes" " comment
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

"" quickfixsigns {{{
"noremap <silent> <leader><c-l> :call quickfixsigns#RelNumbersOnce()<cr>

"" No fucking flags. Nobody likes fucking flag bitmaps.
"let g:quickfixsigns_classes = ['loc', 'marks', 'vcsdiff', 'breakpoints']
"let g:quickfixsigns_aggregated_errors = 1
"let g:quickfixsigns_sort_aggregated_errors = 1
"" }}}

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

" }}}

" Completion {{{

"set complete=.,t
set completeopt=menuone,longest,preview,noinsert,noselect

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
""if ! has('nvim')
""  let g:jedi#auto_vim_configuration = 0
""endif
""let g:jedi#auto_initialization = 1
""let g:jedi#use_tabs_not_buffers = 1
""let g:jedi#use_splits_not_buffers = "left"
""let g:jedi#use_splits_not_buffers = 1
"let g:jedi#popup_on_dot = 1
"let g:jedi#popup_select_first = 0
"" Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.
"let g:jedi#max_doc_height = 30
"let g:jedi#auto_close_doc = 0
""let g:jedi#squelch_py_warning = 1
"let g:jedi#goto_definitions_command = "<leader>gg"

"let g:jedi#show_call_signatures = 1
let g:jedi#show_call_signatures = 2  " show in cmdline
let g:jedi#show_call_signatures_delay = 250  " ms (500)

" Default mappings:
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"


inoremap <F2> <ESC>K!i

" 2}}}

" Rope {{{2
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"let g:ropevim_vim_completion = 1
"let g:ropevim_extended_complete = 1
" 2}}}

" 1}}}

" Syntastic {{{

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

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
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

"au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"  \| exe "normal g'\"" | endif

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
" }}}

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

"" Quick paste
"nnoremap <c-v><c-v> i<leader><tab><c-r>+<leader><tab><Esc>
"inoremap <c-v><c-v> <leader><tab><c-r>+<leader><tab>
""nnoremap <c-v><c-c> i<c-r>+<Esc>
""inoremap <c-v><c-c> <c-r>+

" Use Q for formatting the current paragraph (or selection)
vmap <Leader>q gq
nmap <Leader>q gqap

" Paste
"set pastetoggle=<leader><tab>
"set pastetoggle=<F3>
"map <F3> <leader><tab>

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
"nmap <silent> <leader>rv :augroup reload_vimrc<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Stupid osx
nmap <bs> <c-h>

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
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Folding {{{
set foldenable
""set foldmethod=marker
"set foldmarker={{{,}}}
"set foldcolumn=2
""set foldnestmax=2
set foldmethod=indent
set foldlevel=5
set foldlevelstart=10
set foldminlines=5
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
"noremap <silent> <Leader>f :QFix<CR>
noremap <silent> <Leader>qf :QFix<CR>

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

"" Plugin options

" NERDTree {{{
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

"" NERDTress File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
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

"" YouCompleteMe
"nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>g :YcmCompleter GoTo<CR>

" CommandT
"nmap <leader>` :CommandT<CR>
"nmap <leader><leader>` :CommandTBuffer<CR>

" Quit
map q :q<cr>
"map <Leader>q q
map <c-q> :q<cr>
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
"map <leader>` :suspend<cr>

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
"au Bufenter *.hs compiler ghc
"
"" configure browser for haskell_doc.vim
"let g:haddock_browser = "xdg-open"
"" }}}

" TaskList
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']

"" Ack (grep replacement)
"let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" vim-notes
let g:notes_directories = ["~/Notes", "~/docs", "~/Documents"]

" Only set indent when no other was loaded.
if !exists("b:did_indent")
  set smartindent
endif

"" IndentLines {{{
"" Vim
"let g:indentLine_color_term = 239

""GVim
"let g:indentLine_color_gui = '#A4E57E'

"" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)

"let g:indentLine_concealcursor = 'vc' "(default 'inc')
"let g:indentLine_conceallevel = 0  "(default 2)
" }}}

"" Multiple cursors
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"" UltiSnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"" Oblique
let g:oblique#incsearch_highlight_all=1
"autocmd! User Oblique       normal! zz
"autocmd! User ObliqueStar   normal! zz
"autocmd! User ObliqueRepeat normal! zz

" Language: Go {{{
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
" }}}

" Plugin: Startify {{{
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

"" Probs with ctrlp
"autocmd User Startified setlocal buftype=
"let g:ctrlp_reuse_window = 'startify'

"" Author's config
"autocmd User Startified setlocal cursorline

"let g:startify_enable_special         = 0
"let g:startify_files_number           = 8
"let g:startify_relative_path          = 1
"let g:startify_change_to_dir          = 1
"let g:startify_session_autoload       = 1
"let g:startify_session_persistence    = 1
"let g:startify_session_delete_buffers = 1

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

"let g:startify_skiplist = [
"            \ 'COMMIT_EDITMSG',
"            \ 'plugger/.*/doc',
"            \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vim/vimrc' },
      \ { 't': '/tmp' },
      \ { 'p' : expand('~/vk/git/proxy')},
      \ expand('~/vk/git/proxy/libs/vkconf'),
      \ ]

"let g:startify_custom_footer =
"        \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

"hi StartifyBracket ctermfg=240
"hi StartifyFile    ctermfg=147
"hi StartifyFooter  ctermfg=240
"hi StartifyHeader  ctermfg=114
"hi StartifyNumber  ctermfg=215
"hi StartifyPath    ctermfg=245
"hi StartifySlash   ctermfg=240
"hi StartifySpecial ctermfg=240
" }}}

" NERDCommenter
let g:NERDCustomDelimiters = {
      \ 'yaml': { 'left': '#'},
      \}

"" VIMWiki
"let g:vimwiki_folding = 1
"let g:vimwiki_fold_lists = 1
"let g:vimwiki_list = [{"path" : "~/docs/wiki"}]
"nmap <Leader>wv <Plug>VimwikiIndex

" Edit macro
"nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Always splits to the right and below
set splitright
set splitbelow

" Boost performance of rendering long lines
set synmaxcol=200

" Sets how many lines of history vim has to remember
"set history=10000

" Display unprintable chars
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=10

" Min width of the number column to the left
"set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Set sensible heights for splits
set winheight=30
" Setting this causes problems with Unite-outline. Don't really need it
" set winminheight=5

" Make regex a little easier to type
set magic

" Lower the delay of escaping out of other modes
" set timeout timeoutlen=1000 ttimeoutlen=1
"set timeout timeoutlen=200 ttimeoutlen=1

"set linebreak

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" Use a low updatetime. This is used by CursorHold
"set updatetime=1000

"" Cursor settings. This makes terminal vim sooo much nicer!
"" Tmux will only forward escape sequences to the terminal if surrounded by a DCS
"" sequence
"if exists('$TMUX')
"  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Maximize current split
"nnoremap <Leader>a <C-w>_<C-w><Bar>

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"" Ctrl-[hl]: Move left/right by word
"cnoremap <c-h> <s-left>
"cnoremap <c-l> <s-right>

"" Ctrl-Space: Show history
"cnoremap <c-@> <c-f>

"cnoremap <c-j> <down>
"cnoremap <c-k> <up>
"cnoremap <c-f> <left>
"cnoremap <c-g> <right>

" Ctrl-v: Paste
"cnoremap <c-v> <c-r>"

" w!: Change ro files to rw
" function! s:chmodonwrite()
" if v:cmdbang
" silent !chmod u+w %
" endif
" endfunction
" autocmd MyAutoCmd bufwrite * call s:chmodonwrite()

"" w!!: Writes using sudo
"cnoremap w!! w !sudo tee % >/dev/null

" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
"vnoremap <c-c> y`]

"" Ctrl-r: Easier search and replace
"vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

"" Ctrl-s: Easier substitue
"vnoremap <c-s> :s/\%V//g<left><left><left>

"" Ctrl-f: Find with MultipleCursors
"vnoremap <c-f> :MultipleCursorsFind

" Alt-a: Select all
"nnoremap <silent> a :keepjumps normal ggVG<CR>

" Alt-s: Go back in changelist. HACK ALERT! Ctrl-i generates s with iTerm2
"nnoremap s <c-i>

" Alt-h: Go to previous buffer
"nnoremap <silent> h :bprevious<CR>

" Alt-j: Move current line down
" nnoremap <silent> j mz:m+<cr>`z==

" Alt-k: Move current line up
" nnoremap <silent> k mz:m-2<cr>`z==

" Alt-l: Go to next buffer
"nnoremap <silent> l :bnext<CR>

"" Alt-Shift-j: Duplicate line down
"nnoremap <silent> J mzyyp`zj

"" Alt-Shift-k: Duplicate line up
"nnoremap <silent> K mzyyp`z

" Alt-o: Jump back in the changelist
"nnoremap o g;

" Alt-i: Jump forward in the changelist
"nnoremap i g,

"set undofile

"" Ctrl-W ins delete previous word
"inoremap <silent> <C-W> <C-\><C-O>db
"" Ctrl-U ins delete line
"inoremap <silent> <C-U> <C-\><C-O>d0
"" Ctrl-Y ins paste in
"inoremap <silent> <C-Y> <C-R>"

"" n: Next, keep search matches in the middle of the window
"nnoremap n nzzzv

"" Tab: Indent
"xmap <Tab> >

"" shift-tab: unindent
"xmap <s-tab> <

"" <|>: Reselect visual block after indent
"xnoremap < <gv
"xnoremap > >gv

"" Backspace: Delete selected and go into insert mode
"xnoremap <bs> c

"xnoremap , <Leader>cb

"let g:ultisnips_python_style = 'normal'
"let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_style = 'google'
"let g:ultisnips_python_style = 'jedi'
"let g:UltiSnipsUsePythonVersion = 3

let g:EasyMotion_smartcase=1

map <Leader>eb :edit ~/.vim/bundles.vim<cr>

if has('nvim')
  map <Leader>es :edit ~/.vim/startup.nvim<cr>
else
  map <Leader>es :edit ~/.vim/startup.vim<cr>
endif

map <Leader> <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Automagic views: restore_view.vim
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" init user augroup "{{{

" syntax highlight's is ~/.nvim/after/syntax/vim.vim
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>

" }}}

set pumheight=0 " 0 is Enable maximum displayed completion words in omnifunc list

set cmdheight=2

set noautoindent
"set nobackup
set noerrorbells
set nofoldenable
set nolazyredraw
"set noswapfile
set notitle
set novisualbell
set nowrapscan
"set nowritebackup

" Ignore default plugins
" http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
let g:loaded_2html_plugin      = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_gzip              = 1
let g:loaded_netrw             = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_rrhelper          = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1

let g:go_highlight_error = 1

" libvterm mode config
" Disable all listchars
if mode() == "t"
  setlocal listchars=
  setlocal nonumber
endif

" Allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 100000


""
"" Deoplete
""

if has('nvim')
  "let g:deoplete#sources = {}
  ""let g:deoplete#sources._ = ['buffer', 'tag']
  "let g:deoplete#sources._ = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.python = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.cpp = ['buffer', 'tag']

  " Use smartcase.
  let g:deoplete#enable_smart_case = 1

  "" From github: zchee/deoplete-go
  " neocomplete like
  " https://github.com/Shougo/deoplete.nvim/blob/master/doc/deoplete.txt
  set completeopt+=noinsert

  " Set before than deoplete
  " deoplete#mappings#_set_completeopt() in
  " https://github.com/Shougo/deoplete.nvim/blob/master/autoload/deoplete/mappings.vim
  " https://github.com/Shougo/deoplete.nvim/blob/master/rplugin/python3/deoplete/deoplete.py
  "set completeopt+=noselect

  let g:deoplete#enable_at_startup = 1

  "" <C-h>, <BS>: close popup and delete backword char.
  "inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  "inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

  " Allow <CR> to select
  inoremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"

  "" <CR>: close popup and save indent.
  "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  "function! s:my_cr_function() abort
  "  return deoplete#mappings#close_popup() . "\<CR>"
  "endfunction

  "let g:deoplete#auto_completion_start_length = 1
  "let g:deoplete#file#enable_buffer_path = 1
  ""let g:deoplete#enable_refresh_always = 1
  let g:deoplete#enable_auto_pairs = 'true'
  "let g:neopairs#enable = 1

  "" Go for deoplete
  let g:deoplete#sources#go = 'vim-go'

  "" jedi for deoplete
  Gautocmdft python setlocal omnifunc=jedi#completions
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#popup_select_first = 0
  let g:jedi#completions_enabled = 0
  "let g:jedi#force_py_version = 3
  let g:jedi#smart_auto_mappings = 1
  let g:jedi#show_call_signatures = 2
  "let g:jedi#max_doc_height = 100

  "if !exists('g:deoplete#force_omni_input_patterns')
  "  let g:deoplete#force_omni_input_patterns = {}
  "endif
  "let g:deoplete#force_omni_input_patterns.python =
  "      \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endif

" Konfekt/FastFold
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1

let g:cpsm_highlight_mode = 'detailed' " none, basic, detailed

" clang-format
" Ref: http://algo13.net/clang/clang-format-style-oputions.html
" FIXME: Optios not works?
let g:clang_format#code_style = 'google'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_map_keys = 0

" Zsh:
Gautocmdft zsh setlocal tabstop=4 softtabstop=4 shiftwidth=4
Gautocmdft sh setlocal tabstop=4 softtabstop=4 shiftwidth=4

" Bash:
" Enable bash syntax on /bin/sh shevang
" http://tyru.hatenablog.com/entry/20101007/
let g:is_bash = 1

" Dockerfile:
Gautocmd BufRead,BufNewFile *.dockerfile,Dockerfile.* set filetype=dockerfile
"Gautocmdft Dockerfile setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4 nocindent

" Markdown:
"Gautocmd BufRead,BufNewFile *.md set filetype=markdown
"Gautocmd BufRead,BufNewFile *.md let g:deoplete#disable_auto_complete = 0

" Gitconfig:
Gautocmdft gitconfig setlocal softtabstop=4 shiftwidth=4 noexpandtab

" Vagrant:
Gautocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Vim:
" develop nvimrc helper
Gautocmd BufWritePost $MYVIMRC,*.vim nested silent! source $MYVIMRC
" Gautocmd BufRead,BufNewFile $MYVIMRC, init.vim setlocal tags=$MYVIMRC . '/tags'
Gautocmdft vim setlocal tags=$XDG_CONFIG_HOME/nvim/tags
" Gautocmd BufWritePost $MYVIMRC cd ~/.nvim; call vimproc#system("ctags -R --fields=+l --sort=yes &")
Gautocmd BufWritePost $MYVIMRC silent! call vimproc#system("ctags -R --fields=+l -f $XDG_CONFIG_HOME/nvim/tags $XDG_CONFIG_HOME/nvim &")

" https://github.com/neovim/neovim/blob/master/runtime/vimrc_example.vim
" When editing a file, always jump to the last known cursor position.  Don't
" do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" Posission when opening a file
Gautocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' |
      \   execute "normal! g`\"" |
      \   execute "call feedkeys('zz')" |
      \ endif

" Smart help window
" https://github.com/rhysd/dotfiles/blob/master/nvimrc#L380-L405
command! -nargs=* -complete=help SmartHelp call <SID>smart_help(<q-args>)
function! s:smart_help(args)
  try
    if winwidth(0) > winheight(0) * 2
      execute 'vertical rightbelow help ' . a:args
    else
      execute 'rightbelow help ' . a:args
    endif
  catch /^Vim\%((\a\+)\)\=:E149/
    echohl ErrorMsg
    echomsg "E149: Sorry, no help for " . a:args
    echohl None
  endtry
endfunction

" Show highlight group name under a cursor
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

" Display syntax infomation on under the current cursor
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " CTERMFG: " . BASEsYN.CTERMFG .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()

" Set parent git directory to current path
" http://michaelheap.com/set-parent-git-directory-to-current-path-in-vim/
function! CtagsGitRoot()
  let b:gitdir = system("git rev-parse --show-toplevel")
  if b:gitdir !~? "^fatal"
    cd `=b:gitdir`
    call vimproc#system("ctags -R --fields=+l --sort=yes &")
  endif
endfunction

" Protect header library
Gautocmd BufNewFile,BufRead /System/Library/Frameworks/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode.app/Contents/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode-beta.app/Contents/* setlocal readonly nomodified

" Json Format
command! -nargs=0 -bang -complete=command FormatJSON %!python -m json.tool

" Unload plugin in runtimepath
function! PlugUnload(name)
  execute 'set rtp-=~/.config/nvim/plugged/' . a:name . '/'
endfunction

" Clear message logs
command! MessageClear for n in range(200) | echom "" | endfor

" Binary edit mode
" need open nvim with `-b` flag
function! BinaryMode() abort
  if !has('binary')
    echoerr "BinaryMode must be 'binary' option"
    return
  endif

  execute '%!xxd'
endfunction

" Mappnig leader prefix
" CtrlP buffer
nnoremap <silent> .b   :<C-u>CtrlPBuffer<CR>
" CtrlP commandline
nnoremap <silent> .c   :<C-u>CtrlPCmdline<CR>
" Launch Dirvish
nnoremap <silent> .d   :<C-u>Dirvish<CR>
" Focus next buffer
nnoremap <silent> .m   <C-w>w
" Switch Next tab
nnoremap <silent> .n   gt
" Switch Previous tab
nnoremap <silent> .p   gT
" Split and focus new buffer
nnoremap <silent> .s   :<C-u>split<CR><C-w>w
" Create new tab
nnoremap <silent> .t   :<C-u>tabnew<CR>
" Vsplit and focus new buffer
nnoremap <silent> .v   :<C-w>vsplit<CR><C-w>w
" CtrlP yankround
nnoremap <silent> .y   :CtrlPYankRound<CR>
" Switch next or previous tab
nnoremap <silent> .z   :bNext<CR>
" nnoremap <silent> .<Left>  "_yiw?\v\w+\_W+%#<CR>:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o><C-l>:set nohlsearch<CR>
" nnoremap <silent> .<Right> "_yiw:s/\v(%#\w+)(\_W+)(\w+)/\3\2\1/<CR><C-o>/\v\w+\_W+<CR><C-l>:set nohlsearch<CR>

"if mode() != "t"
"  let mapleader = "\<Space>"
"elseif mode() == "t"
"  " set mapleader to tmux like bindkey on terminal buffer
"  let mapleader = "\<C-b>"
"endif

nnoremap  <silent> <Leader>h  :<C-u>SmartHelp<Space><C-l>
"nnoremap  <silent> <Leader>n  :TagbarToggle<CR>
"nnoremap  <silent> <Leader>t  :<C-u>tabnew \| :terminal<CR>
"nnoremap  <silent> <Leader>r  :<C-u>QuickRun<CR>
"nnoremap  <silent> <Leader>s  :%s///g<Left><Left><Left>
"nnoremap  <silent> <Leader>w  :<C-u>w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Normal "{{{
"

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Search current word, but not move next search word
nnoremap * *:call feedkeys("\<S-n>")<CR>

" Cancel highlight search word
"nnoremap <silent> <C-q>  :<C-u>nohlsearch<CR>
" When type 'x' key(delete), do not add yank register
nnoremap x "_x
" Jump marked line
nnoremap zj    zjzt
nnoremap zk    2zkzjzt
" Switch suspend! map
"nnoremap ZZ    ZQ
" Disable suspend
"nnoremap ZQ    <Nop>
" http://ku.ido.nu/post/90355094974/how-to-grep-a-word-under-the-cursor-on-vim
nnoremap <M-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>
nnoremap <A-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>
" fast scroll
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Move cursor to lines {upward|downward},
" on the first non-blank character
"nnoremap <C-j> <C-m>
"nnoremap <C-k> -

"nnoremap <C-z> <Nop>

" tmux like switch the next to each other of the buffer
function! SwitchBuffer()
  if &switchbuf != "useopen"
    let saveSwitchbuf = &switchbuf
    set switchbuf=useopen
  endif
  let b:currentBuffer = expand('%:p')
  echo expand('%:p')
  " call feedkeys("\<C-w>w") | let b:sideBuffer = expand('%:p')
  execute feedkeys("\<C-w>w")
  echo expand('%:p')
  " :edit b:currentBuffer<CR>
  " call feedkeys("\<C-w>w")
  " set switchbuf=expand(`=b:saveSwitchbuf`)
  " :edit b:sideBuffer<CR>
endfunction
nnoremap zo :call SwitchBuffer()<CR>

let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
  else
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2
    set showcmd
  endif
endfunction

" Python
" Gautocmdft python nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<CR>
Gautocmdft python nnoremap <buffer><silent><C-]>     :<C-u>call jedi#goto()<CR>

" Vim
" <C-u>: http://d.hatena.ne.jp/e_v_e/20150101/1420067539
Gautocmdft vim nnoremap <silent> K :<C-u>SmartHelp<Space><C-r><C-w><CR>

"" neosnippet
"imap <C-k>  <Plug>(neosnippet_expand_or_jump)
"smap <C-k>  <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>  <Plug>(neosnippet_expand_target)
"imap <C-s> <Plug>(neosnippet_expand_or_jump)
"smap <C-s> <Plug>(neosnippet_expand_or_jump)
" vim-operator-user
"  - operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)

" for languages documents
function! DocMappings()
  " Select the linked word
  nnoremap <silent><buffer><Tab> /\%(\_.\zs<Bar>[^ ]\+<Bar>\ze\_.\<Bar>CTRL-.\<Bar><[^ >]\+>\)<CR>
  " less likes keymap
  nnoremap <silent><buffer>u <C-u>
  nnoremap <silent><buffer>d <C-d>
  nnoremap <silent><buffer>q :q<CR>
endfunction
Gautocmdft help,ref,man,qf,godoc,gedoc,quickrun,gita-blame-navi,dirvish call DocMappings()

"" tcomment
"nmap <silent> gcc <Plug>TComment_gcc
"xmap <silent> gc  <Plug>TComment_gc

noremap <F3> :Autoformat<CR>
"au BufWrite * :Autoformat

" AWS filetypes (aws.json)
let g:AWSVimValidate = 1

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"fun! g:RunEvent()
"  runtime! 
"endfun

" Post event
runtime! post.vim
" NeoVim
if has('nvim')
  "set lazyredraw
  runtime! post.nvim
endif

set diffopt=filler,icase,iwhite,context:3,vertical

let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']

"nmap <space> <leader>
"imap <silent><space> <leader>
"

" Always use a new split when opening a file from quickfix
set switchbuf=split

set cmdheight=2
"set noshowmode
let g:echodoc_enable_at_startup = 1

set shortmess+=Ic
set pumheight=15

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim fdm=marker ff=unix fileencoding=utf-8:
