" Normal mode
let s:N1 = [ '#ECF0C1' , '#6E5346' , 15 , 55 ]
let s:N2 = [ '#6E5346' , '#121212' , 15 , 55 ]
let s:N3 = [ '#6E5346' , '#121212' , 15 , 98 ]

" Insert mode
let s:I1 = [ '#ECF0C1' , '#2daee0' , 15 , 33  ]
let s:I2 = [ '#ECF0C1' , '#66D9EF' , 15 , 39  ]
let s:I3 = [ '#6E5346' , '#121212' , 15 , 233 ]

" Visual mode
let s:V1 = [ '#121212' , '#A6E22E' , 233 , 202 ]
let s:V2 = [ '#121212' , '#A6E22E' , 15 , 98 ]
let s:V3 = [ '#6E5346' , '#121212' , 15 , 98 ]

" Replace mode
let s:R1 = [ '#ECF0C1' , '#F92672' , 15 , 196 ]
let s:R2 = [ '#ECF0C1' , '#F92672' , 15 , 98 ]
let s:R3 = [ '#ECF0C1' , '#121212' , 15 , 233 ]

let g:airline#themes#spacedust#palette = {}
let g:airline#themes#spacedust#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#spacedust#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#spacedust#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#spacedust#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let g:airline#themes#spacedust#palette.normal.airline_warning = [ '#ECF0C1' , '#F92672' , 15 , 196 ]
let g:airline#themes#spacedust#palette.insert.airline_warning = [ '#ECF0C1' , '#F92672' , 15 , 196 ]
let g:airline#themes#spacedust#palette.visual.airline_warning = [ '#ECF0C1' , '#F92672' , 15 , 196 ]
let g:airline#themes#spacedust#palette.replace.airline_warning = [ '#ECF0C1' , '#F92672' , 15 , 196 ]

" Inactive mode
let s:IN1 = [ '#9e9e9e' , '#303030' , 247 , 236 ]
let s:IN2 = [ '#ECF0C1' , '#121212' , 15  , 233 ]

let s:IA = [ s:IN1[1] , s:IN2[1] , s:IN1[3] , s:IN2[3] , '' ]
let g:airline#themes#spacedust#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 =  [ '#ECF0C1' , '#2daee0' , 15 , 55 ]
let s:CP2 =  [ '#ECF0C1' , '#66D9EF' , 15 , 98 ]
let s:CP3 =  [ '#2daee0' , '#ECF0C1' , 55 , 15 ]

let g:airline#themes#spacedust#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)
