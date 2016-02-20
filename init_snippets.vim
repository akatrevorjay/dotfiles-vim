

" Ctrl-Space {{{
set showtabline=0

"if has("gui_running")
"    " Settings for MacVim and Inconsolata font
"    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
"endif

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

"let g:CtrlSpaceSearchTiming = 500

nnoremap <silent><C-p> :CtrlSpace O<CR>

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
" }}}


" YouCompleteMe {{{
"set completeopt-=preview
let g:ycm_complete_in_comments = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
" }}}



"" Filetype specifics {{{
set completefunc=syntaxcomplete#Complete
"set omnifunc=syntaxcomplete#Complete



"" profiling {{{
"nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
"nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
"nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
"nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>
"" }}}



" Unite {{{
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" }}}




 " Indent guides {{{
 "let g:indent_guides_auto_colors = 0
 "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=100
 "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=40
 "let g:indent_guides_enable_on_vim_startup = 1
 "let g:indent_guides_guide_size = 1
 let g:indent_guides_start_level = 2
 " }}}



" Odd cursorhold thing, slow as balls
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal g'\"" | endif

"" Mark last pos with vim-addon-signs
sign define cursor_location text=-
augroup TRACK_LAST_CURSOR_POS_FOR_EACH_WINDOW
  au!
  autocmd CursorHold,CursorHoldI,CursorMoved,CursorMovedI *
    \   let b:last_cursor_pos = [bufnr('%'), line('.'), 'cursor_location']
    \ | call vim_addon_signs#Push("last_cursor_pos", map(filter(range(1, bufnr('$')), 'bufexists(v:val) && has_key(getbufvar(v:val,""),"last_cursor_pos")'), 'getbufvar(v:val, "last_cursor_pos")' ))
augroup end

"" Add a dummy sign so that the left column showing the signs is always present:
" can't use an opaque sign :-(
sign define dummy text=.
augroup TRACK_LAST_CURSOR_POS_FOR_EACH_WINDOW
  au!
  autocmd BufNew * call vim_addon_signs#Push("dummy", map(filter(range(1, bufnr('$')), 'bufexists(v:val)'), '[v:val, 1, "dummy"]' ))
augroup end
 }}}




" Quick paste
nnoremap <c-v><c-v> i<leader><tab><c-r>+<leader><tab><Esc>
inoremap <c-v><c-v> <leader><tab><c-r>+<leader><tab>
"nnoremap <c-v><c-c> i<c-r>+<Esc>
"inoremap <c-v><c-c> <c-r>+

" Paste
set pastetoggle=<leader><tab>
set pastetoggle=<F3>
map <F3> <leader><tab>



" Quickfix
noremap <silent> <F4> :QFix<CR>
noremap <silent> <Leader>f :QFix<CR>



"" MakeGreen defaults to \t
map <Leader>] <Plug>MakeGreen


" django-nose test runner
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>



" MiniBufExplorer Toggle default is \mbe
map <Leader>b :TMiniBufExplorer<cr>
map <Leader>b :let g:miniBufExplSplitBelow=0<cr>:let g:miniBufExplVSplit=0<cr>:TMiniBufExplorer<cr>
map <Leader>] :let g:miniBufExplSplitBelow=1<cr>:let g:miniBufExplVSplit=1<cr>:TMiniBufExplorer<cr>

" Ack (! means do not open the first file automagically)
nmap <leader>a <Esc>:Ack!


"" Allow to use <S-Tab> for CTRL-P in an xterm:
"" > put in shrc: xmodmap -e "keysym Tab = Tab Find"
" cmap <Esc>[1~ <C-P>



" w!: Change ro files to rw
" function! s:chmodonwrite()
" if v:cmdbang
" silent !chmod u+w %
" endif
" endfunction
" autocmd MyAutoCmd bufwrite * call s:chmodonwrite()

"" w!!: Writes using sudo
"cnoremap w!! w !sudo tee % >/dev/null





"" Ctrl-[hl]: Move left/right by word
"cnoremap <c-h> <s-left>
"cnoremap <c-l> <s-right>

"" Ctrl-Space: Show history
"cnoremap <c-@> <c-f>

"cnoremap <c-j> <down>
"cnoremap <c-k> <up>
"cnoremap <c-f> <left>
"cnoremap <c-g> <right>


" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
"vnoremap <c-c> y`]

"" Ctrl-r: Easier search and replace
"vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

"" Ctrl-s: Easier substitue
"vnoremap <c-s> :s/\%V//g<left><left><left>

"" Ctrl-f: Find with MultipleCursors
"vnoremap <c-f> :MultipleCursorsFind

" Alt-a: Select all
"nnoremap <silent> a :keepjumps normal ggVG<CR>

" Alt-s: Go back in changelist. HACK ALERT! Ctrl-i generates s with iTerm2
"nnoremap s <c-i>

" Alt-h: Go to previous buffer
"nnoremap <silent> h :bprevious<CR>

" Alt-j: Move current line down
" nnoremap <silent> j mz:m+<cr>`z==

" Alt-k: Move current line up
" nnoremap <silent> k mz:m-2<cr>`z==

" Alt-l: Go to next buffer
"nnoremap <silent> l :bnext<CR>

"" Alt-Shift-j: Duplicate line down
"nnoremap <silent> J mzyyp`zj

"" Alt-Shift-k: Duplicate line up
"nnoremap <silent> K mzyyp`z

" Alt-o: Jump back in the changelist
"nnoremap o g;

" Alt-i: Jump forward in the changelist
"nnoremap i g,

"set undofile

"" Ctrl-W ins delete previous word
"inoremap <silent> <C-W> <C-\><C-O>db
"" Ctrl-U ins delete line
"inoremap <silent> <C-U> <C-\><C-O>d0
"" Ctrl-Y ins paste in
"inoremap <silent> <C-Y> <C-R>"

"" n: Next, keep search matches in the middle of the window
"nnoremap n nzzzv

"" Tab: Indent
"xmap <Tab> >

"" shift-tab: unindent
"xmap <s-tab> <

"" <|>: Reselect visual block after indent
"xnoremap < <gv
"xnoremap > >gv

"" Backspace: Delete selected and go into insert mode
"xnoremap <bs> c

"xnoremap , <Leader>cb


"" tcomment
"nmap <silent> gcc <Plug>TComment_gcc
"xmap <silent> gc  <Plug>TComment_gc


"" Ctrl-[hl]: Move left/right by word
"cnoremap <c-h> <s-left>
"cnoremap <c-l> <s-right>

"" Ctrl-Space: Show history
"cnoremap <c-@> <c-f>

"cnoremap <c-j> <down>
"cnoremap <c-k> <up>
"cnoremap <c-f> <left>
"cnoremap <c-g> <right>


" Ctrl-c: Copy (works with system clipboard due to clipboard setting)
"vnoremap <c-c> y`]

"" Ctrl-r: Easier search and replace
"vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

"" Ctrl-s: Easier substitue
"vnoremap <c-s> :s/\%V//g<left><left><left>

"" Ctrl-f: Find with MultipleCursors
"vnoremap <c-f> :MultipleCursorsFind

" Alt-a: Select all
"nnoremap <silent> a :keepjumps normal ggVG<CR>

" Alt-s: Go back in changelist. HACK ALERT! Ctrl-i generates s with iTerm2
"nnoremap s <c-i>

" Alt-h: Go to previous buffer
"nnoremap <silent> h :bprevious<CR>

" Alt-j: Move current line down
" nnoremap <silent> j mz:m+<cr>`z==

" Alt-k: Move current line up
" nnoremap <silent> k mz:m-2<cr>`z==

" Alt-l: Go to next buffer
"nnoremap <silent> l :bnext<CR>

"" Alt-Shift-j: Duplicate line down
"nnoremap <silent> J mzyyp`zj

"" Alt-Shift-k: Duplicate line up
"nnoremap <silent> K mzyyp`z

" Alt-o: Jump back in the changelist
"nnoremap o g;

" Alt-i: Jump forward in the changelist
"nnoremap i g,

"set undofile

"" Ctrl-W ins delete previous word
"inoremap <silent> <C-W> <C-\><C-O>db
"" Ctrl-U ins delete line
"inoremap <silent> <C-U> <C-\><C-O>d0
"" Ctrl-Y ins paste in
"inoremap <silent> <C-Y> <C-R>"

"" n: Next, keep search matches in the middle of the window
"nnoremap n nzzzv

"" Tab: Indent
"xmap <Tab> >

"" shift-tab: unindent
"xmap <s-tab> <

"" <|>: Reselect visual block after indent
"xnoremap < <gv
"xnoremap > >gv

"" Backspace: Delete selected and go into insert mode
"xnoremap <bs> c

"xnoremap , <Leader>cb


"let g:ultisnips_python_style = 'normal'
"let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_style = 'google'
"let g:ultisnips_python_style = 'jedi'
"let g:UltiSnipsUsePythonVersion = 3

"" neosnippet
"imap <C-k>  <Plug>(neosnippet_expand_or_jump)
"smap <C-k>  <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>  <Plug>(neosnippet_expand_target)
"imap <C-s> <Plug>(neosnippet_expand_or_jump)
"smap <C-s> <Plug>(neosnippet_expand_or_jump)
" vim-operator-user
"  - operator-surround

"" Gautocmdft python nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<CR>
"Gautocmdft python nnoremap <buffer><silent><C-]>     :<C-u>call jedi#goto()<CR>

"map <silent>sa <Plug>(operator-surround-append)
"map <silent>sd <Plug>(operator-surround-delete)
"map <silent>sr <Plug>(operator-surround-replace)


"" for languages documents
"function! DocMappings()
"  " Select the linked word
"  nnoremap <silent><buffer><Tab> /\%(\_.\zs<Bar>[^ ]\+<Bar>\ze\_.\<Bar>CTRL-.\<Bar><[^ >]\+>\)<CR>
"  " less likes keymap
"  nnoremap <silent><buffer>u <C-u>
"  nnoremap <silent><buffer>d <C-d>
"  nnoremap <silent><buffer>q :q<CR>
"endfunction
"Gautocmdft help,ref,man,qf,godoc,gedoc,quickrun,gita-blame-navi,dirvish call DocMappings()



" tmux like switch the next to each other of the buffer
function! SwitchBuffer()
  if &switchbuf != "useopen"
    let saveSwitchbuf = &switchbuf
    set switchbuf=useopen
  endif
  let b:currentBuffer = expand('%:p')
  echo expand('%:p')
  " call feedkeys("\<C-w>w") | let b:sideBuffer = expand('%:p')
  execute feedkeys("\<C-w>w")
  echo expand('%:p')
  " :edit b:currentBuffer<CR>
  " call feedkeys("\<C-w>w")
  " set switchbuf=expand(`=b:saveSwitchbuf`)
  " :edit b:sideBuffer<CR>
endfunction
nnoremap zo :call SwitchBuffer()<CR>

let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all  == 0
    let s:hidden_all = 1
    set noshowmode
    set noruler
    set laststatus=0
    set noshowcmd
  else
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2
    set showcmd
  endif
endfunction






" vim: set ts=2 sw=2 tw=78 et ft=vim :
