
""
"" Smart in-line manpages with 'K' in command mode
"" ~trevorj 061112 no longer needed using symlinked ftplugin/man.vim from
"" vim installdir into plugin/ then using :Man func
""

if (exists("g:loaded_man") || &cp)
  finish
endif
let g:loaded_man = '0.1'

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
"noremap K :call ReadMan()<CR>
"map K :call ReadMan()<CR>

