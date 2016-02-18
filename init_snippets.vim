

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



"" Unite {{{
"let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
"nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
"nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

"" Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
"  " Play nice with supertab
"  let b:SuperTabDisabled=1
"  " Enable navigation with control-j and control-k in insert mode
"  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"endfunction
"" }}}




" " Indent guides {{{
" "let g:indent_guides_auto_colors = 0
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=100
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=40
" "let g:indent_guides_enable_on_vim_startup = 1
" "let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" " }}}



