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

"" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

runtime rc/early.vim local/early.vim
runtime rc/lib.vim

if has('vim_starting')
  if &compatible
    set nocompatible      " Be iMproved
  endif

  runtime! rc/starting.vim
endif

" Plugins: {{{
call plug#begin('~/.vim/plugged')

"if has('nvim')
"  runtime! plugins.nvim local/plugins.nvim
"endif
runtime! plugins.vim local/plugins.vim

" Add plugins to &runtimepath
call plug#end()
" }}}

syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype


"if has('nvim')
"  runtime! rc/autoload/*.nvim
"endif
runtime! rc/autoload/*.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set ft=vim ff=unix fileencoding=utf-8 fdm=marker:

