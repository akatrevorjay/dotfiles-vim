
" Folding {{{
set foldenable
""set foldmethod=marker
"set foldmarker={{{,}}}
"set foldcolumn=2
""set foldnestmax=2
set foldmethod=indent
set foldlevel=5
set foldlevelstart=10
set foldminlines=5
set shiftround                          " Indent/outdent to nearest tabstops

"" Vimrc files get to use marker folds
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=marker | endif
augroup END

"" Use space to toggle folding
" nnoremap <space> za
" vnoremap <space> zf
"" OR
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
" }}}

" remove trailing whitespace
"autocmd FileType python autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"" Toggle quickfix {{{
noremap <silent> <Leader>qf :QFix<CR>

"the quickfix window is not always 10 lines height
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" quickfix toogler
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    "let g:pylint_cwindow = 0
    unlet g:qfix_win
  else
    copen 10
    call AdjustWindowHeight(3, 10)
    "let g:pylint_cwindow = 1
    let g:qfix_win = bufnr("$")
  endif
endfunction
"" }}}

