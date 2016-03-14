
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
"let g:qirline_theme = 'serene'


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

" enable iminsert detection
let g:airline_detect_iminsert = 1
let airline#extensions#default#section_use_groupitems = 1

" Patch airline theme before apply
"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
"  if g:airline_theme == 'badwolf'
"    for colors in values(a:palette.inactive)
"      let colors[3] = 245
"    endfor
"  endif
"endfunction

"" short mode
"let g:airline_mode_map = {
"    \ '__' : '-',
"    \ 'n'  : 'N',
"    \ 'i'  : 'I',
"    \ 'R'  : 'R',
"    \ 'c'  : 'C',
"    \ 'v'  : 'V',
"    \ 'V'  : 'V',
"    \ '' : 'V',
"    \ 's'  : 'S',
"    \ 'S'  : 'S',
"    \ '' : 'S',
"    \ }


" lc mode
let g:airline_mode_map = {
      \ '__' : '------',
      \ 'n'  : 'normal',
      \ 'i'  : 'insert',
      \ 'R'  : 'replace',
      \ 'v'  : 'visual',
      \ 'V'  : 'v-line',
      \ 'c'  : 'command',
      \ '' : 'v-block',
      \ 's'  : 'select',
      \ 'S'  : 's-line',
      \ '' : 's-block',
      \ 't'  : 'terminal',
      \ }


"" enable/disable fugitive/lawrencium integration >
"let g:airline#extensions#branch#enabled = 1
"" change the text for when no branch is detected >
""let g:airline#extensions#branch#empty_message = ''
"" define the order in which the branches of different vcs systems will be
"" displayed on the statusline (currently only for fugitive and lawrencium) >
"let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
"" use vcscommand.vim if available >
"let g:airline#extensions#branch#use_vcscommand = 0
"" truncate long branch names to a fixed length >
"let g:airline#extensions#branch#displayed_head_limit = 10

" default value leaves the name unmodifed
"let g:airline#extensions#branch#format = 0

" to only show the tail, e.g. a branch 'feature/foo' becomes 'foo', use
let g:airline#extensions#branch#format = 1
" to truncate all path sections but the last one, e.g. a branch
" 'foo/bar/baz' becomes 'f/b/baz', use
"let g:airline#extensions#branch#format = 2
"" if a string is provided, it should be the name of a function that
"" takes a string and returns the desired value
"let g:airline#extensions#branch#format = 'CustomBranchName'
"function! CustomBranchName(name)
"  return '[' . a:name . ']'
"endfunction

" Optional extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#exclude_preview = 1

let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1

"let g:airline#extensions#tabline#tab_nr_type = 0 " # of splits (default)
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number

let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0

"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" * configure the formatting of filenames (see |filename-modifiers|). >
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#tmuxline#enabled = 0
"let airline#extensions#tmuxline#color_template = 'normal' (default)
"let airline#extensions#tmuxline#color_template = 'insert'
"let airline#extensions#tmuxline#color_template = 'visual'
"let airline#extensions#tmuxline#color_template = 'replace'




let g:airline#extensions#whitespace#enabled = 1




" TODO Are these automatically enabled or not?
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#hunks#non_zero_only = 1
"let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#eclim#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
"
let g:airline#extensions#promptline#enabled = 1
let g:airline#extensions#promptline#snapshot_file = $HOME.'/.shell/themes/airline-snapshot.sh'
"let airline#extensions#promptline#color_template = 'visual'
let airline#extensions#promptline#color_template = 'normal'

"let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#ycm#enabled = 1
"let g:airline#extensions#ycm#error_symbol = 'E:'
"let g:airline#extensions#ycm#warning_symbol = 'W:'

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

" any command can be used in a slice, for example to print the output of whoami in section 'b':
"       \'b' : [ '$(whoami)'],
"
" more than one slice can be placed in a section, e.g. print both host and user in section 'a':
"       \'a': [ promptline#slices#host(), promptline#slices#user() ],
"
" }}}

" Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1


"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"" unicode symbols
""let g:airline_left_sep = '»'
""let g:airline_left_sep = '▶'
""let g:airline_right_sep = '«'
""let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

"" powerline symbols
""let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
""let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

""" old vim-powerline symbols
""let g:airline_left_sep = '⮀'
""let g:airline_left_alt_sep = '⮁'
""let g:airline_right_sep = '⮂'
""let g:airline_right_alt_sep = '⮃'
""let g:airline_symbols.branch = '⭠'
""let g:airline_symbols.readonly = '⭤'
""let g:airline_symbols.linenr = '⭡'


" 1}}}
