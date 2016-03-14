" Keys: {{{

" Quick vim commands
nnoremap ; :

" Quickly edit/reload the vimrc file
augroup reload_vimrc
  " Clear existing group
  au!
  au bufwritepost $MYVIMRC nested source $MYVIMRC

  if exists("g:loaded_webdevicons")
    au bufwritepost $MYVIMRC call webdevicons#refresh()
  endif

  if exists("g:loaded_airline")
    au bufwritepost $MYVIMRC AirlineRefresh
  endif
augroup END
nmap <silent> <leader>rv :so $MYVIMRC<CR>:call webdevicons#refresh()<CR>:AirlineRefresh<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>

" Allow move around using ctrl+arrows
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
" Close with F12
noremap <silent> <C-F12> :bd!<CR>

" Move around windows easier
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Make cmdline editing better
"cmap <tab> <c-n>

" Fix arrows in screen
"map ^[OC <Right>
"map ^[OD <Left>
"map ^[[C <S-Right>
"map ^[[D <S-Left>

" Move between buffers with super+left/right (broken)
map <D-Left> [b
map <D-Right> ]b

" Move between buffers with alt+left/right
map <M-Left> [b
map <M-Right> ]b

" In iterm2 on osx, I usually map left opt to control, since opt is broken on
" osx anyway...
map <C-Left> [b
map <C-Right> ]b

" Stupid OSX (and libtermkey really)
" https://github.com/neovim/neovim/issues/2048
"if has('nvim')
"  nmap <BS> <C-h>
"endif

"" Use Q for formatting the current paragraph (or selection) (seems broken)
"vmap <Leader>q gq
"nmap <Leader>q gqap

"" YouCompleteMe
nnoremap <leader>j :YcmCompleter GoToDefinition<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>gr :YCMCompleter GotoReferences<CR>
nmap <leader>gi :YCMCompleter GotoImplementation<CR>
map <leader>D :YcmCompleter GetDoc<CR>


" ycmd
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python2'

" Extra baby
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Disable <tab> in pum
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"let g:ycm_key_list_select_completion=['<TAB>', '<Down>']
"let g:ycm_key_list_previous_completion=['<S-TAB>', '<Up>']

" Identifier based completion
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2

let g:ycm_auto_trigger = 1
let g:ycm_always_populate_location_list = 0
let g:ycm_disable_for_files_larger_than_kb = 1000

" Semantic uses this python for compl
let g:ycm_python_binary_path = expand('~/.pyenv/shims/python')

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_goto_buffer_command = 'horizontal-split'

let g:ycm_semantic_triggers =  {
      \   'python': ['.', ',', '(', ')'],
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
      \             're!\[.*\]\s'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,typescript,d,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \ }

"YCM comes with support for UltiSnips (snippet suggestions in the popup menu),
"but you'll have to change the UltiSnips mappings. See ':h UltiSnips-triggers'
"in Vim for details. You'll probably want to change some/all of the following
"options:
">
"  g:UltiSnipsExpandTrigger
"  g:UltiSnipsJumpForwardTrigger
"  g:UltiSnipsJumpBackwardTrigger


" CommandT
"nmap <leader>` :CommandT<CR>
"nmap <leader><leader>` :CommandTBuffer<CR>

" Gundo
map <Leader>u :GundoToggle<cr>

"" TaskList defaults to \t
"map <leader>v <Plug>TaskList
"map <leader>td <Plug>TaskList

"" Py.test
"" Execute the tests
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Don't use Ex mode, use Q for formatting
"noremap Q gq

"" Search current word, but not move next search word
"nnoremap * *:call feedkeys("\<S-n>")<CR>

" Cancel highlight search word
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR>

" When type 'x' key(delete), do not add yank register
nnoremap x "_x

" Jump marked line
nnoremap zj    zjzt
nnoremap zk    2zkzjzt

" http://ku.ido.nu/post/90355094974/how-to-grep-a-word-under-the-cursor-on-vim
nnoremap <M-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>
nnoremap <A-h> :<C-u>SmartHelp<Space><C-r><C-w><CR>

"" fast scroll
"nnoremap <C-e> 2<C-e>
"nnoremap <C-y> 2<C-y>

" Move cursor to lines {upward|downward}, on the first non-blank character
"nnoremap <C-j> <C-m>
"nnoremap <C-k> -

" Switch suspend! map
map <leader>` :suspend<cr>
map ZZ :suspend<cr>
"nnoremap ZZ    ZQ

" Quit
map q :q<cr>
"map <M-q> :q<cr>
map <c-q> :q<cr>
map W :wq<cr>
map Q :q!<cr>
map ZQ :q!<cr>
"map QQ :q!<cr>
"map <c-w> :bd<cr>
map <m-q> :bd<cr>
"map <c-Q> :bd!<cr>

"" Quickly exit insert mode
""imap jj <Esc>
"" Can be typed even faster than jj.
"imap jk <Esc>
"" Press i to enter insert mode, and ii to exit.
"imap ii <Esc>
""" Pressing Ctrl-L leaves insert mode in evim, so why not in regular vim, too.
""imap <C-L> <Esc>

"" In Mac OS X, mapping <S-space> does not work, but the following
"" is better (press the "apple" key and the space key).
"" Note that this will conflict with the spotlight shortcut
"imap <D-space> <Esc>
"" On gvim and Linux console Vim, you can use Alt-Space.
"imap <M-Space> <Esc>

" Press Shift-Space (may not work on your system).
"imap <S-Space> <Esc>
" Try the following so Shift-Space also enters insert mode.
"nmap <S-Space> i
"" Or just Space to enter insert mode.
"nmap <Space> i


" <Leader>c*: NERDCommenter mappings
" <Leader>cd: Switch to the directory of the open buffer
nnoremap <Leader>cd :cd %:p:h<cr>:pwd<cr>

" Maximize current split
nnoremap <Leader>a <C-w>_<C-w><Bar>

" Switch to previous split
nnoremap <leader>, <C-w>p

" Bash like keys for the command line. These resemble personal zsh mappings
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Edit macro
"nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Quick vimrc edits
map <Leader>eb :edit ~/.vim/rc/bundles.vim<cr>
map <Leader>es :edit ~/.vim/rc/startup.vim<cr>
if has('nvim')
  map <Leader>neb :edit ~/.vim/rc/bundles.nvim<cr>
  map <Leader>nes :edit ~/.vim/rc/startup.nvim<cr>
endif

"let g:tmux_navigator_save_on_switch = 1
"let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
"nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
"nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
"nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" }}}


"noremap <F3> :Autoformat<CR>
""au BufWrite * :Autoformat

