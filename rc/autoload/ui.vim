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
  "elseif has("mvim")
  else
    "set guifont=Menlo\ for\ Powerline:h12
    "set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h14  " nerd font complete
    set guifont=Hack\ Regular:h14
  endif
endif
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
let g:rehash256 = 1  " Alt color scheme under dev that attempts to make molokai 256 as close as possible to dark gui
"colorscheme OceanicNext
"let g:airline_theme = 'oceanicnext'

"let g:triplejelly_background_color = '000000'
"let g:triplejelly_background_color_256 = '000000'
"let g:triplejelly_foreground_color = 'C6CFD2'  " Default
let g:triplejelly_foreground_color = 'A7B7C7'
let g:triplejelly_background_color = '000000'
augroup ColorScheme
  au! *
  "highlight Comment guibg=#323230 guifg=#9999aa
  "highlight Comment guibg=#252525 guifg=#9999aa
  highlight Comment guibg=#252525 guifg=#bbbbcc
  highlight Identifier guibg=#121255
  highlight String guibg=#331133
augroup END
colorscheme triplejelly
let g:airline_theme = 'jellybeans'

let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1

" This actually messes up numerous schemes.
let g:colorschemer_auto = 0

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
let airline#extensions#promptline#color_template = 'visual'

let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'

" sections (a, b, c, x, y, z, warn) are optional
let g:promptline_preset = {
      \'a' : [ promptline#slices#host({'only_if_ssh': 1}) ],
      \'b' : [ promptline#slices#user() ],
      \'c' : [ promptline#slices#cwd() ],
      \'x' : [ promptline#slices#jobs() ],
      \'y' : [ promptline#slices#git_status(), promptline#slices#vcs_branch() ],
      \'z' : [ promptline#slices#python_virtualenv() ],
      \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ],
      \}

"\'options': {
"\'left_sections' : [ 'b', 'a' ],
"\'right_sections' : [ 'c' ],
"\'left_only_sections' : [ 'b', 'a', 'c' ]}

" available slices:
"
" promptline#slices#cwd() - current dir, truncated to 3 dirs. To configure: promptline#slices#cwd({ 'dir_limit': 4 })
" promptline#slices#vcs_branch() - branch name only. By default, only git branch is enabled. Use promptline#slices#vcs_branch({ 'hg': 1, 'svn': 1, 'fossil': 1}) to enable check for svn, mercurial and fossil branches. Note that always checking if inside a branch slows down the prompt
" promptline#slices#last_exit_code() - display exit code of last command if not zero
" promptline#slices#jobs() - display number of shell jobs if more than zero
" promptline#slices#battery() - display battery percentage (on OSX and linux) only if below 10%. Configure the threshold with promptline#slices#battery({ 'threshold': 25 })
" promptline#slices#host() - current hostname.  To hide the hostname unless connected via SSH, use promptline#slices#host({ 'only_if_ssh': 1 })
" promptline#slices#user()
" promptline#slices#python_virtualenv() - display which virtual env is active (empty is none)
" promptline#slices#git_status() - count of commits ahead/behind upstream, count of modified/added/unmerged files, symbol for clean branch and symbol for existing untraced files
"
" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" to disable powerline symbols
" `let g:promptline_powerline_symbols = 0`

" }}}

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" 1}}}
