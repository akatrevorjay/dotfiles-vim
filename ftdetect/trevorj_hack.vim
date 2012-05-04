
" For now, all HTML files
au BufRead,BufNewFile *.html set filetype=jinja

" All pys
au BufRead,BufNewFile *.py set filetype=python

" Bash
au BufRead,BufNewFile *.sh set filetype=sh

if did_filetype()   " filetype already set
    finish
elseif getline(1) =~ '^#/usr/bin/env python'
    setfiletype python
elseif getline(1) =~ '^<html'
    setfiletype jinja
elseif getline(1) =~ '^<doctype'
    setfiletype jinja
endif

" vim:noexpandtab
