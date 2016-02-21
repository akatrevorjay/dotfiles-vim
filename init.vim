" Debian: defaults {{{
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
" }}}

" Init: {{{
"" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible      " Be iMproved
  endif

  runtime! starting.vim
  if has('nvim')
    runtime! starting.nvim
  endif
endif

" Plugins: {{{
call plug#begin('~/.vim/plugged')

" Source bundles.vim
runtime! bundles.vim local/bundles.vim
if has('nvim')
  runtime! bundles.nvim local/bundles.nvim
endif

" Add plugins to &runtimepath
call plug#end()
" }}}

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype

" }}}

" Gautocmd: fucs {{{
" syntax highlight's is ~/.nvim/after/syntax/vim.vim
augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>

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

"" Vim
"" <C-u>: http://d.hatena.ne.jp/e_v_e/20150101/1420067539
"Gautocmdft vim nnoremap <silent> K :<C-u>SmartHelp<Space><C-r><C-w><CR>

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

" Json Format
command! -nargs=0 -bang -complete=command FormatJSON %!python -m json.tool

if exists('g:plugger')
  " Unload plugin in runtimepath
  function! PlugUnload(name)
    execute 'set rtp-=~/.config/nvim/plugged/' . a:name . '/'
  endfunction
endif

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
" }}}

" Basic: setup (misc/search/highlight/nu/gui/invisibles) {{{
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
"set smartcase          " Do smart case matching (If uppercase letter, then sensitive)
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned

set mouse=a             " Enable mouse usage (all modes) in terminals
"set mouse=nvch         " all modes but insert
"set mousemodel="extend" " popup popup_setpos

" Update buffer when a file is changed from the outside
"set autoread

" Write buffer when leaving
" Automatically save before commands like :next and :make
"set autowrite

" Let OS know when to flush disk
set nofsync

" no backup/swap
"set nowritebackup
"set nobackup
"set noswapfile

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Ignore case in file searches
set ignorecase
" .. Except when we use any upper case in the pattern
set smartcase

" Highlight all results of search
set hlsearch
" Ctrl-L clears the highlight from the last search
"noremap <C-l> :nohlsearch<CR><C-l>
"noremap! <C-l> <ESC>:nohlsearch<CR><C-l>

" Stupid hack for qtile not telling gvim to redraw
"nmap r :redraw!<cr>

" Highlight the line the cursor is on (local to window)
set cursorline
"set cursorcolumn

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
" Min width of the number column to the left
set numberwidth=1
" Relative line numbers
set relativenumber

" Invisibles
set list

" When using set list:

if $LANG =~ ".*\.UTF-8$" || $LANG =~ ".*utf8$" || $LANG =~ ".*utf-8$"
  "set listchars=precedes:…,extends:…
  set listchars=extends:❯,precedes:❮
  set listchars+=nbsp:␣
  set listchars+=tab:»\ ,trail:·
  set showbreak=↪
else
  set lcs=tab:>-,eol:$,nbsp:%,trail:X,extends:>,precedes:<
  "set listchars=tab:>.,trail:.,extends:#,nbsp:.
  "set listchars=tab:>-,trail:-
  "set listchars=tab:..
endif

" Color column
set cc=120
"hi ColorColumn ctermbg=lightblue guibg=lightblue

" Highlight columns over 120
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)

"set pumheight=0 " 0 is Enable maximum displayed completion words in omnifunc list
"set cmdheight=2

" Always splits to the right and below
set splitright
set splitbelow

" Boost performance of rendering long lines
set synmaxcol=200

" Sets how many lines of history vim has to remember
"set history=10000

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=10

" No need to show mode
set noshowmode

" Set sensible heights for splits
set winheight=30
" Setting this causes problems with Unite-outline. Don't really need it
" set winminheight=5

" Show info in window title
set title

" Set the text of the icon for this window
set icon

"" Make regex a little easier to type
"set magic

" Lower the delay of escaping out of other modes
" set timeout timeoutlen=1000 ttimeoutlen=1
"set timeout timeoutlen=200 ttimeoutlen=1

" wrap long lines at a character in 'breakat'
set linebreak

" preserve indent to wrapped text
set breakindent

" When completing tags in Insert mode show more info
set showfulltag

" Highlight spelling mistakes
"set spell
set spelllang=en_us

" file that "zg" adds good words to
"set spellfile=

" Start a dialog when a command fails
set confirm

" Error bells
set errorbells

set matchpairs=(:),{:},[:],<:>,*:*,\":\",\':\',\|:\|,\^:\$
set nrformats=bin,octal,hex

"set selection=inclusive
"set selectmode=mouse

set textwidth=120
"set wrapmargin=2

"set formatoptions=jcroql
"set formatoptions=tcroqwan2jl

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"" Spelling highlights. Use underline in term to prevent cursorline highlights
"" from interfering
"if !has("gui_running")
"  hi clear SpellBad
"  hi SpellBad cterm=underline ctermfg=red
"  hi clear SpellCap
"  hi SpellCap cterm=underline ctermfg=blue
"  hi clear SpellLocal
"  hi SpellLocal cterm=underline ctermfg=blue
"  hi clear SpellRare
"  hi SpellRare cterm=underline ctermfg=blue
"endif

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

" }}}

" Variance: (console/gvim/macvim) setup {{{
set guioptions=acMh
set mousefocus " focus follows mouse in gvim
if has("gui_running")
  " ColorScheme: These look much nicer in gui mode
  "colorscheme railscasts-trevorj
  "colorscheme neverland-darker

  " Font: GUI font selection is different per OS
  if has("gui_gtk2")
    set guifont=Menlo\ for\ Powerline\ 16
    set guifontwide=Menlo\ for\ Powerline\ 16
    "set guifont=Monaco\ for\ Powerline\ 16
    "set guifont=ProFontWindows\ 12
  elseif has("gui_photon")
    set guifont=Menlo\ for\ Powerline:s12
  elseif has("gui_kde")
    set guifont=Menlo\ for\ Powerline/12/-1/5/50/0/0/0/1/0
  elseif has("x12")  " Should this be x11?
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    "set guifont=Menlo\ for\ Powerline:h12
    set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14  " nerd font complete
  endif
endif
" }}}

" Spacing: tabstops/indents {{{
" Number of spaces used for autoindent (local to buffer)
set shiftwidth=2
" Tab width
set tabstop=2
set softtabstop=2
set showtabline=2

" Indent/outdent to nearest tabstops
"set shiftround

" Spaces instead of tabs
set expandtab

" Always set auto indenting on
set autoindent
"" Only set indent when no other was loaded.
"if !exists("b:did_indent")
"  " Clever autoindenting (Means?)
"  set smartindent
"endif
" Clever autoindenting (Means?)
set smartindent

" copy whitespace for indenting from previous line
set copyindent

" Last line should be EoL
set endofline

"" Fixes missing EoL at end of file (default_
"set fixeol

set fileignorecase
set wildignorecase

" indenting for C code
"set cindent

" Store undo
set undofile

" Enable reading .vimrc/.exrc/.gvimrc in the current dir
"set exrc

" Don't fuck with existing spacing unless we have to.
set preserveindent
" }}}

" Folding: {{{
set foldenable
"set foldmethod=marker  " syntax indent
"set foldmarker={{{,}}}
"set foldcolumn=2
"set foldnestmax=2
set foldlevel=5
set foldminlines=5

" Initial: Number of levels to open initially
set foldlevelstart=10
" all
"set foldlevelstart=99

"" Use space to toggle folding
" nnoremap <space> za
" vnoremap <space> zf
"" OR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" UI {{{1

"" 256 color mode, ofc
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
else
  set t_Co=256
endif

set background=dark

" Colorschemes: {{{
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

" }}}

" Airline: {{{

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

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" 1}}}

" Keys: {{{

" Quick vim commands
nnoremap ; :

" Quickly edit/reload the vimrc file
augroup reload_vimrc
  " Clear existing group
  au!
  au bufwritepost $MYVIMRC nested source $MYVIMRC

  if exists("g:loaded_webdevicons")
    au bufwritepost $MYVIMRC call webdevicons#refresh()
  endif

  if exists("g:loaded_airline")
    au bufwritepost $MYVIMRC AirlineRefresh
  endif
augroup END
nmap <silent> <leader>rv :so $MYVIMRC<CR>:call webdevicons#refresh()<CR>:AirlineRefresh<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Allow move around using ctrl+arrows
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
" Close with F12
noremap <silent> <C-F12> :bd!<CR>

" Move around windows easier
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Make cmdline editing better
"cmap <tab> <c-n>

" Fix arrows in screen
"map ^[OC <Right>
"map ^[OD <Left>
"map ^[[C <S-Right>
"map ^[[D <S-Left>

" Move between buffers with super+left/right (broken)
map <D-Left> [b
map <D-Right> ]b

" Move between buffers with alt+left/right
map <M-Left> [b
map <M-Right> ]b

" In iterm2 on osx, I usually map left opt to control, since opt is broken on
" osx anyway...
map <C-Left> [b
map <C-Right> ]b

" Stupid osx
nmap <bs> <c-h>

"" Use Q for formatting the current paragraph (or selection) (seems broken)
"vmap <Leader>q gq
"nmap <Leader>q gqap

"" YouCompleteMe
"nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>g :YcmCompleter GoTo<CR>

" CommandT
"nmap <leader>` :CommandT<CR>
"nmap <leader><leader>` :CommandTBuffer<CR>

" Gundo
map <Leader>u :GundoToggle<cr>

"" TaskList defaults to \t
"map <leader>v <Plug>TaskList
"map <leader>td <Plug>TaskList

"" Py.test
"" Execute the tests
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Don't use Ex mode, use Q for formatting
"noremap Q gq

"" Search current word, but not move next search word
"nnoremap * *:call feedkeys("\<S-n>")<CR>

" Cancel highlight search word
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>

" When type 'x' key(delete), do not add yank register
nnoremap x "_x

" Jump marked line
nnoremap zj    zjzt
nnoremap zk    2zkzjzt

" http://ku.ido.nu/post/90355094974/how-to-grep-a-word-under-the-cursor-on-vim
nnoremap <M-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>
nnoremap <A-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>

"" fast scroll
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

" Move cursor to lines {upward|downward}, on the first non-blank character
"nnoremap <C-j> <C-m>
"nnoremap <C-k> -

" Switch suspend! map
map <leader>` :suspend<cr>
map ZZ :suspend<cr>
"nnoremap ZZ    ZQ

" Quit
"map qq :q<cr>
"map Q :q<cr>
"map <a-q> :q<cr>
"map <c-q> :q<cr>
"map QQ :q!<cr>
map <c-q> :bd<cr>
"map <c-Q> :bd!<cr>
map W :wq<cr>
map ZQ :q!<cr>

"" Quickly exit insert mode
""imap jj <Esc>
"" Can be typed even faster than jj.
"imap jk <Esc>
"" Press i to enter insert mode, and ii to exit.
"imap ii <Esc>
""" Pressing Ctrl-L leaves insert mode in evim, so why not in regular vim, too.
""imap <C-L> <Esc>

"" In Mac OS X, mapping <S-space> does not work, but the following
"" is better (press the "apple" key and the space key).
"" Note that this will conflict with the spotlight shortcut
"imap <D-space> <Esc>
"" On gvim and Linux console Vim, you can use Alt-Space.
"imap <M-Space> <Esc>

" Press Shift-Space (may not work on your system).
imap <S-Space> <Esc>
" Try the following so Shift-Space also enters insert mode.
nmap <S-Space> i
"" Or just Space to enter insert mode.
"nmap <Space> i

" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Maximize current split
nnoremap <Leader>a <C-w>_<C-w><Bar>

" Switch to previous split
nnoremap <leader>, <C-w>p

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Edit macro
"nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Quick vimrc edits
map <Leader>eb :edit ~/.vim/bundles.vim<cr>
map <Leader>es :edit ~/.vim/startup.vim<cr>
if has('nvim')
  map <Leader>neb :edit ~/.vim/bundles.nvim<cr>
  map <Leader>nes :edit ~/.vim/startup.nvim<cr>
endif
" }}}

" Base: {{{
" }}}

" Completion: {{{

" Wild: completion options {{{
set wildchar=<Tab>
set wildmenu
"set wildmode=longest,list
"set wildmode=longest:full,list:longest,list:full
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.swo,*.bak,*.pyo,*.pyc,*.svn,*/tmp/*,__pycache__,sdist,bdist,dist,build,*.egg-info
set wildoptions=tagfile
" }}}

" Code complete
"inoremap <Nul> <C-x><C-o>

"set complete=.,t
set completeopt=menuone,longest,preview,noinsert,noselect

" Python omni is handled by Jedi <3
"Gautocmdft python setlocal omnifunc=pythoncomplete#Complete
"Gautocmdft python setlocal completefunc=pythoncomplete#Complete
Gautocmdft php setlocal omnifunc=phpcomplete#CompletePHP
Gautocmdft css setlocal omnifunc=csscomplete#CompleteCSS
Gautocmdft html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
Gautocmdft xml setlocal omnifunc=xmlcomplete#CompleteTags
Gautocmdft javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" TODO default to syntaxcomplete#Complete
"set completefunc=syntaxcomplete#Complete
"set omnifunc=syntaxcomplete#Complete

"" Completion: Jedi {{{
if ! has('nvim')  " Vim
  ""let g:jedi#auto_initialization = 1
  ""let g:jedi#use_tabs_not_buffers = 1
  ""let g:jedi#use_splits_not_buffers = "left"
  ""let g:jedi#use_splits_not_buffers = 1
  "let g:jedi#popup_on_dot = 1
  "let g:jedi#popup_select_first = 0
  "" Jedi displays function call signatures in insert mode in real-time, highlighting the current argument.
  "" The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the
  "" advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2),
  "" which can improve the integrity of Vim's undo history.
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

  "inoremap <F2> <ESC>K!i
else  " NeoVim
  "" jedi for deoplete
  "Gautocmdft python setlocal omnifunc=jedi#completions
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#popup_on_dot = 0
  let g:jedi#popup_select_first = 0
  let g:jedi#completions_enabled = 0
  "let g:jedi#force_py_version = 3
  "let g:jedi#smart_auto_mappings = 0
  let g:jedi#show_call_signatures = 2  " show in cmdline
  let g:jedi#show_call_signatures_delay = 250  " ms (500)
  "let g:jedi#max_doc_height = 100

  "if !exists('g:deoplete#force_omni_input_patterns')
  "  let g:deoplete#force_omni_input_patterns = {}
  "endif
  "let g:deoplete#force_omni_input_patterns.python =
  "      \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
endif
" }}}

" Deoplete: {{{
if has('nvim')
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
  "let g:deoplete#auto_completion_start_length = 1
  "let g:deoplete#file#enable_buffer_path = 1
  ""let g:deoplete#enable_refresh_always = 1

  " Use smartcase.
  let g:deoplete#enable_smart_case = 1

  " Use head matcher instead of fuzzy matcher
  "call deoplete#custom#set('_', 'matchers', ['matcher_head'])

  " Integrate with neopairs
  let g:deoplete#enable_auto_pairs = 'true'

  "let g:deoplete#sources = {}
  ""let g:deoplete#sources._ = ['buffer', 'tag']
  "let g:deoplete#sources._ = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.python = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.cpp = ['buffer', 'tag']

  "" Go for deoplete
  let g:deoplete#sources#go = 'vim-go'
  let g:deoplete#sources#python = 'jedi'

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
endif
" }}}

" Clang: {{{
if has('nvim')
  " Deoplete support
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_omnicppcomplete_compliance = 0
  let g:clang_make_default_keymappings = 0
  "let g:clang_use_library = 1
endif
" }}}

" }}}

" Syntastic: {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
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
"let g:syntastic_quiet_messages = {'quiet': 'warnings'}
""let g:syntastic_loc_list_height = 10

" Syntastic-extras {{{
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
"nnoremap ZZ :call syntastic_extras#quit_hook()<cr>
" }}}

" }}}

" EasyMotion: {{{
let g:EasyMotion_smartcase=1

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
" }}}

" Jump: to the last position when reopening a file {{{
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

" }}}

" Rope: {{{
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>

"let g:ropevim_vim_completion = 1
"let g:ropevim_extended_complete = 1
" }}}

" Language: Go {{{
let g:go_highlight_error = 1
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

" Startify: {{{
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

"let g:startify_custom_header =
"      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

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

"" Multiple cursors
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"" Oblique
let g:oblique#incsearch_highlight_all=1
"Gautocmd User Oblique       normal! zz
"Gautocmd User ObliqueStar   normal! zz
"Gautocmd User ObliqueRepeat normal! zz

" TaskWarrior: {{{
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = ['minimal', 'newest', 'oldest', 'overdue', 'recurring', 'waiting', 'all', 'blocked']
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999 rc.defaultheight=0 rc.confirmation=no'

" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 1  " 0
" info window size
"let g:task_info_size       = 15
" info window position
"let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
"let g:task_log_directory   = '~/.task'
" max number of historical entries
"let g:task_log_max         = '20'
" forward arrow shown on statusline
"let g:task_left_arrow      = ' <<'
" backward arrow ...
"let g:task_left_arrow      = '>> '
" }}}

" CtrlP: {{{

map <leader>1 :CtrlPBuffer<cr>
map <leader>2 :CtrlPBufTag<cr>
map <leader>@ :CtrlPBufTagAll<cr>
map <leader>= :CtrlPBookmarkDir<cr>
map <leader>+ :CtrlPBookmarkDirAdd<cr>
map <leader>0 :CtrlPCmdPalette<cr>
"map <leader>: :CtrlPQuickfix
map <leader>b :CtrlPBuffer<cr>
map <leader>mru :CtrlPMRUFiles<cr>

"map <leader>B :CtrlPBuffer<cr>
"map <leader>u :CtrlPUndo<cr>
"map <leader>u :CtrlPChange<cr>

"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 100000
let g:ctrlp_lazy_update = 1
let g:ctrlp_regexp_search = 1

"let g:ctrlp_tilde_homedir = 1

let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'setup.py', 'Dockerfile', 'package.json', '.git']
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

" Tagbar: {{{
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

" AWS: filetypes (aws.json) {{{
let g:AWSVimValidate = 1
" }}}

" JSON: {{{
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  "autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
" }}}

" TaskList: {{{
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']
" }}}

" Notes: {{{
let g:notes_directories = ["~/Notes"]
" }}}

" NERDCommenter: {{{
let g:NERDCustomDelimiters = {
      \ 'yaml': { 'left': '#'},
      \}
" }}}

" Ignore: default plugins {{{
" http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
"let g:loaded_2html_plugin      = 1
"let g:loaded_getscript         = 1
"let g:loaded_getscriptPlugin   = 1
"let g:loaded_gzip              = 1
"let g:loaded_netrw             = 1
"let g:loaded_netrwFileHandlers = 1
"let g:loaded_netrwPlugin       = 1
"let g:loaded_netrwSettings     = 1
"let g:loaded_rrhelper          = 1
"let g:loaded_tar               = 1
"let g:loaded_tarPlugin         = 1
"let g:loaded_vimball           = 1
"let g:loaded_vimballPlugin     = 1
"let g:loaded_zip               = 1
"let g:loaded_zipPlugin         = 1
" }}}

" Allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 100000

" Konfekt/FastFold {{{
let g:tex_fold_enabled=1
let g:vimsyn_folding='afP'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
Gautocmdft perl,php,xml,tex,python set foldmethod=syntax
" }}}

"let g:cpsm_highlight_mode = 'detailed' " none, basic, detailed

" clang-format
" Ref: http://algo13.net/clang/clang-format-style-oputions.html
" FIXME: Optios not works?
let g:clang_format#code_style = 'google'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

" C: {{{
let c_gnu = 1
let c_comment_strings = 1
let c_space_errors = 1
"let c_no_trail_space_error = 1
"let c_no_tab_space_error = 1
"let c_no_bracket_error = 1
"let c_no_curly_error = 1
let c_curly_error = 1
"let c_no_ansi = 1
"let c_ansi_typedefs = 1
"let c_ansi_constants = 1
"let c_no_utf = 1
"let c_syntax_for_h = 1
"let c_no_if0 = 1
"let c_no_cformat = 1
"let c_no_c99 = 1
"let c_no_c11 = 1

" Work around highlighting errors when scrolling backwards
"let c_minlines = 100
" }}}

" Haskell: {{{
let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
" }}}

" gitgutter: {{{
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_map_keys = 0
" }}}

" Python: {{{
"let python_no_number_highlight = 1
"let python_no_builtin_highlight = 1
"let python_no_exception_highlight = 1
"let python_no_doctest_highlight = 1
"let python_space_error_highlight = 1
let python_highlight_all = 1
" }}}

" SQL:
let g:sql_type_default = 'postgresql'

" Shell:
Gautocmdft zsh,sh setlocal tabstop=4 softtabstop=4 shiftwidth=4
let g:sh_fold_enabled= 4   "  (enable if/do/for folding)

" Bash:
" Enable bash syntax on /bin/sh shevang
" http://tyru.hatenablog.com/entry/20101007/
let g:is_bash = 1

" This will add highlighting for the commands that BASH (version 2.05a and later, and part earlier) adds.
let readline_has_bash = 1

" Dockerfile:
Gautocmd BufRead,BufNewFile *.dockerfile,Dockerfile.* set filetype=dockerfile
"Gautocmdft Dockerfile setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4 nocindent
Gautocmdft Dockerfile setlocal tabstop=4 softtabstop=4 shiftwidth=4 nocindent

" Markdown:
"Gautocmd BufRead,BufNewFile *.md set filetype=markdown
"Gautocmd BufRead,BufNewFile *.md let g:deoplete#disable_auto_complete = 0

" Gitconfig:
Gautocmdft gitconfig setlocal softtabstop=4 shiftwidth=4 noexpandtab

" Vagrant:
Gautocmd BufRead,BufNewFile Vagrantfile set filetype=ruby

" Vim:
Gautocmdft vim setlocal foldmethod=marker

" develop nvimrc helper
Gautocmd BufRead,BufNewFile *.vim,*.nvim set filetype=vim
"Gautocmd BufWritePost $MYVIMRC,*.vim,*.nvim nested silent! source $MYVIMRC
""Gautocmd BufRead,BufNewFile $MYVIMRC, init.vim setlocal tags=$MYVIMRC . '/tags'
"Gautocmdft vim setlocal tags=$XDG_CONFIG_HOME/nvim/tags
"" Gautocmd BufWritePost $MYVIMRC cd ~/.nvim; call vimproc#system("ctags -R --fields=+l --sort=yes &")
"Gautocmd BufWritePost $MYVIMRC silent! call vimproc#system("ctags -R --fields=+l -f $XDG_CONFIG_HOME/nvim/tags $XDG_CONFIG_HOME/nvim &")

" Protect header library
Gautocmd BufNewFile,BufRead /System/Library/Frameworks/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode.app/Contents/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode-beta.app/Contents/* setlocal readonly nomodified

" UltiSnips: {{{
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Python docstring style
"let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_style = 'google'
" }}}

"noremap <F3> :Autoformat<CR>
""au BufWrite * :Autoformat

set diffopt=filler,icase,iwhite,context:3,vertical

let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']

"nmap <space> <leader>
"imap <silent><space> <leader>

" Always use a new split when opening a file from quickfix
set switchbuf=split

" Number of insert completion lines to show
set pumheight=15

"set shortmess+=Ic
"set cmdheight=2
"set noshowmode
let g:echodoc_enable_at_startup = 1

"" Reset search selection map to: <Plug>(clever-f-reset)
"nnoremap <expr><C-l> clever_f#reset() | nohlsearch

"let rst_syntax_code_list = ['vim', 'python']
let g:riv_python_rst_hl = 1

" Proteome: {{{
"let g:proteome_plugins = [
"      \ 'proteome.plugins.ctags',
"      \ 'proteome.plugins.history',
"      \ 'proteome.plugins.config',
"      \ ]

"let g:proteome_config_path = '~/.config/projects'

"let g:proteome_base_dirs = [
"      \ expand('~/vk/git'),
"      \ expand('~/code'),
"      \ ]

"let g:proteome_type_base_dirs = {
"      \ '~/.vim': ['vim'],
"      \ }

"ProAdd py3/proxy { "root": expand('~/vk/git/proxy'), "types": ["python"] }
" }}}

" Shada: {{{
"set shada=!,'100,<50,s10,h
set shada=!,'1000,<1000,s100
"set shada+=%
"rshada! ~/.vim/shada
" }}}

" NeoSnippet: {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_conceal_markers = 1
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1
" }}}

" NeoPairs
let g:neopairs#enable = 1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim ff=unix fileencoding=utf-8 fdm=marker:

