" Normal mode
let s:N1 = [ '#ffffff' , '#FF0055' , 16 , 197]
let s:N2 = [ '#ffffff' , '#000000' , 15 , 16 ]
let s:N3 = [ '#000000' , '#ffffff' , 16 , 15 ]

" Insert mode
let s:I1 = [ '#ffffff' , '#FF4000' , 16 , 202]
let s:I2 = [ '#ffffff' , '#000000' , 15 , 16 ]
let s:I3 = [ '#000000' , '#ffffff' , 16 , 15 ]

" Visual mode
let s:V1 = [ '#000000' , '#4EB4FA' , 16 , 38 ]
let s:V2 = [ '#ffffff' , '#000000' , 15 , 16 ]
let s:V3 = [ '#000000' , '#ffffff' , 16 , 15 ]

" Replace mode
let s:R1 = [ '#ffffff' , '#005F87' , 15 , 24 ]
let s:R2 = [ '#ffffff' , '#000000' , 15 , 16 ]
let s:R3 = [ '#000000' , '#ffffff' , 16 , 15 ]

let g:airline#themes#hemisu_airline#palette = {}
let g:airline#themes#hemisu_airline#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#hemisu_airline#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#hemisu_airline#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#hemisu_airline#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive mode
let s:IN1 = [ '#ffffff' , '#777777' , 15 , 16 ]
let s:IN2 = [ '#ffffff' , '#ffffff' , 15  , 16 ]

let s:IA = [ s:IN1[1] , s:IN2[1] , s:IN1[3] , s:IN2[3] , '' ]
let g:airline#themes#hemisu_airline#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 =  [ '#FF0055' , '#ffffff' , 15 , 197 ]
let s:CP2 =  [ '#ED0028' , '#ffffff' , 15 , 160 ]
let s:CP3 =  [ '#ffffff' , '#FF0055' , 197 , 15 ]

let g:airline#themes#hemisu_airline#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)

" Tabline
let g:airline#themes#hemisu_airline#palette.tabline = {
      \ 'airline_tab':     [ '#FF0055' , '#ffffff' ,  15 , 197  , '' ],
      \ 'airline_tabsel':  [ '#ED0028' , '#ffffff' ,  15 , 160  , '' ],
      \ 'airline_tabtype': [ '#ED0028' , '#ffffff' ,  15 , 160  , '' ],
      \ 'airline_tabfill': [ '#000000' , '#ffffff' ,  15 , 16 , '' ],
      \ 'airline_tabmod':  [ '#7E40A5' , '#ffffff' ,  15 , 128  , '' ]
      \ }
