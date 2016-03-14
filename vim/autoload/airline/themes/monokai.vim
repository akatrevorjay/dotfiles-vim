" Palette
let s:black     = "#272822"
let s:darkgray  = "#49483e"
let s:lightgray = "#75715e"
let s:white     = "#f8f8f2"
let s:lime      = "#a6e22e"
let s:yellow    = "#e6db74"
let s:purple    = "#ae81ff"
let s:cyan      = "#66d9ef"
let s:orange    = "#fd971f"
let s:magenta   = "#f92672"

" Terminal versions
let s:tblack     = 235
let s:tdarkgray  = 238
let s:tlightgray = 242
let s:twhite     = 255
let s:tlime      = 148
let s:tyellow    = 186
let s:tpurple    = 141
let s:tcyan      = 81
let s:torange    = 208
let s:tmagenta   = 197


let g:airline#themes#monokai#palette = {}

let g:airline#themes#monokai#palette.accents = {
            \ 'red':    [s:magenta, s:black, s:tmagenta, s:tblack, ''],
            \ 'green':  [s:lime, s:black, s:tlime, s:tblack, ''],
            \ 'blue':   [s:cyan, s:black, s:tcyan, s:tblack, ''],
            \ 'yellow': [s:yellow, s:black, s:tyellow, s:tblack, ''],
            \ 'orange': [s:orange, s:black, s:torange, s:tblack, ''],
            \ 'purple': [s:purple, s:black, s:tpurple, s:tblack, ''],
            \ }

let s:black_on_cyan = [s:black, s:cyan, s:tblack, s:tcyan, '']
let s:black_on_magenta = [s:black, s:magenta, s:tblack, s:tmagenta, '']
let s:black_on_orange = [s:black, s:orange, s:tblack, s:torange, '']

let s:mode_section = [s:black, s:purple, s:tblack, s:tpurple, '']
let s:info_section = [s:white, s:darkgray, s:twhite, s:tdarkgray, '']
let s:status_section = [s:lightgray, s:black, s:tlightgray, s:tblack, '']
let s:status_section_modified = [s:magenta, s:black, s:tmagenta , s:tblack, 'bold']
let s:inactive_section = [s:lightgray, s:darkgray, s:tlightgray, s:tdarkgray]
let s:inactive_status_section_modified = [s:magenta, s:darkgray, s:tmagenta , s:tdarkgray, 'bold']

let s:default_palette = airline#themes#generate_color_map(
            \ s:mode_section, s:info_section, s:status_section
            \ )
let s:inactive_palette = airline#themes#generate_color_map(
            \ s:inactive_section, s:inactive_section, s:inactive_section,
            \ )
let s:modified_palette = { 'airline_c': s:status_section_modified }
let s:inactive_modified_palette = { 'airline_c': s:inactive_status_section_modified }

" Normal mode
let g:airline#themes#monokai#palette.normal = s:default_palette
let g:airline#themes#monokai#palette.normal_modified = s:modified_palette


" Insert mode
let g:airline#themes#monokai#palette.insert = copy(s:default_palette)
let g:airline#themes#monokai#palette.insert.airline_a = s:black_on_cyan
let g:airline#themes#monokai#palette.insert_modified = s:modified_palette


" Replace mode
let g:airline#themes#monokai#palette.replace = copy(s:default_palette)
let g:airline#themes#monokai#palette.replace.airline_a = s:black_on_magenta
let g:airline#themes#monokai#palette.replace_modified = s:modified_palette


" Visual mode
let g:airline#themes#monokai#palette.visual = copy(s:default_palette)
let g:airline#themes#monokai#palette.visual.airline_a = s:black_on_orange
let g:airline#themes#monokai#palette.visual_modified = s:modified_palette


" Inactive
let g:airline#themes#monokai#palette.inactive = s:inactive_palette
let g:airline#themes#monokai#palette.inactive_modified = s:inactive_modified_palette


" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#monokai#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
            \ [s:purple, s:black, s:tpurple, s:tblack, 'bold'],
            \ [s:white, s:lightgray, s:twhite, s:tlightgray, 'bold'],
            \ [s:black, s:orange, s:tblack, s:torange, ''])
