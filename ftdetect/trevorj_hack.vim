
" For now, all HTML files
au BufRead,BufNewFile *.html set filetype=htmldjango

" All pys
au BufRead,BufNewFile *.py set filetype=python

" Bash
au BufRead,BufNewFile *.sh set filetype=bash

" Readmes
au BufRead,BufNewFile readme* set filetype=mkd
au BufRead,BufNewFile install* set filetype=mkd
au BufRead,BufNewFile *.txt set filetype=mkd

if did_filetype()   " filetype already set
    finish
elseif getline(1) =~ '^#!/usr/bin/env python'
    setfiletype python
elseif getline(1) =~ '^#!/bin/bash'
    setfiletype bash
elseif getline(1) =~ '^#!/bin/sh'
    setfiletype bash
elseif getline(1) =~ '^<html'
    setfiletype jinja
elseif getline(1) =~ '^<doctype'
    setfiletype jinja
endif

" vim:noexpandtab
