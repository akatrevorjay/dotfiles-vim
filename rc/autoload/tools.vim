
" EasyMotion: {{{
let g:EasyMotion_smartcase=1

map <Leader> <Plug>(easymotion-prefix)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Automagic views: restore_view.vim
set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']
" }}}

" Jump: to the last position when reopening a file {{{
" https://github.com/neovim/neovim/blob/master/runtime/vimrc_example.vim
" When editing a file, always jump to the last known cursor position.  Don't
" do it when the position is invalid or when inside an event handler
" Also don't do it when the mark is in the first line, that is the default
" Posission when opening a file
Gautocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype != 'gitcommit' |
      \   execute "normal! g`\"" |
      \   execute "call feedkeys('zz')" |
      \ endif

" }}}

" Startify: {{{
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, '~/.zshrc' ]

" vim -S mysession.vim
" If Session.vim exists in curdir, load it baby.
let g:startify_session_autoload = 1

" Automatically update sessions in two cases:
let g:startify_session_persistence = 1

let g:startify_change_to_vcs_root = 1

"let g:startify_session_savevars = [
"        \ 'g:startify_session_savevars',
"        \ 'g:startify_session_savecmds',
"        \ 'g:random_plugin_use_feature'
"        \ ]

"let g:startify_custom_header =
"      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']

let g:startify_relative_path = 1

"" Probs with ctrlp
"autocmd User Startified setlocal buftype=
"let g:ctrlp_reuse_window = 'startify'

"" Author's config
"autocmd User Startified setlocal cursorline

"let g:startify_enable_special         = 0
"let g:startify_files_number           = 8
"let g:startify_relative_path          = 1
"let g:startify_change_to_dir          = 1
"let g:startify_session_autoload       = 1
"let g:startify_session_persistence    = 1
"let g:startify_session_delete_buffers = 1

"let g:startify_list_order = [
"    \ ['   LRU:'],
"    \ 'files',
"    \ ['   LRU within this dir:'],
"    \ 'dir',
"    \ ['   Sessions:'],
"    \ 'sessions',
"    \ ['   Bookmarks:'],
"    \ 'bookmarks',
"    \ ]

"let g:startify_skiplist = [
"            \ 'COMMIT_EDITMSG',
"            \ 'plugger/.*/doc',
"            \ ]

let g:startify_bookmarks = [
      \ { 'v': '~/.vim/vimrc' },
      \ { 't': '/tmp' },
      \ { 'p' : expand('~/vk/git/proxy')},
      \ expand('~/vk/git/proxy/libs/vkconf'),
      \ ]

"let g:startify_custom_footer =
"        \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

"hi StartifyBracket ctermfg=240
"hi StartifyFile    ctermfg=147
"hi StartifyFooter  ctermfg=240
"hi StartifyHeader  ctermfg=114
"hi StartifyNumber  ctermfg=215
"hi StartifyPath    ctermfg=245
"hi StartifySlash   ctermfg=240
"hi StartifySpecial ctermfg=240
" }}}

"" Multiple cursors
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"" Oblique
let g:oblique#incsearch_highlight_all=1
"Gautocmd User Oblique       normal! zz
"Gautocmd User ObliqueStar   normal! zz
"Gautocmd User ObliqueRepeat normal! zz

" TaskWarrior: {{{
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = ['minimal', 'newest', 'oldest', 'overdue', 'recurring', 'waiting', 'all', 'blocked']
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999 rc.defaultheight=0 rc.confirmation=no'

" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 1  " 0
" info window size
"let g:task_info_size       = 15
" info window position
"let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
"let g:task_log_directory   = '~/.task'
" max number of historical entries
"let g:task_log_max         = '20'
" forward arrow shown on statusline
"let g:task_left_arrow      = ' <<'
" backward arrow ...
"let g:task_left_arrow      = '>> '
" }}}

" CtrlP: {{{

map <leader>1 :CtrlPBuffer<cr>
map <leader>2 :CtrlPBufTag<cr>
map <leader>@ :CtrlPBufTagAll<cr>
" This is taken up by vim-codefmt
"map <leader>= :CtrlPBookmarkDir<cr>
map <leader>+ :CtrlPBookmarkDirAdd<cr>
map <leader>0 :CtrlPCmdPalette<cr>
"map <leader>: :CtrlPQuickfix
map <leader>b :CtrlPBuffer<cr>
map <leader>mru :CtrlPMRUFiles<cr>

"map <leader>B :CtrlPBuffer<cr>
"map <leader>u :CtrlPUndo<cr>
"map <leader>u :CtrlPChange<cr>

"let g:ctrlp_by_filename = 1
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 50
let g:ctrlp_max_files = 100000
let g:ctrlp_lazy_update = 1
let g:ctrlp_regexp_search = 1

"let g:ctrlp_tilde_homedir = 1

let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'setup.py', 'Dockerfile', 'package.json', '.git']
" ag is pretty nice, skips gitignore and all that jazz
let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

" Specific ignore for DVCS/VCS
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.pyc$'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }
" }}}

" Tagbar: {{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30
"let g:tagbar_left = 1
"let g:tagbar_vertical = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 0
let g:tagbar_autoshowtag = 0
let g:tagbar_compact = 0
"let g:tagbar_indent = 2
let g:tagbar_show_linenumbers = 1
let g:tagbar_singleclick = 1
" }}}

" Ignore: default plugins {{{
" http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
"let g:loaded_2html_plugin      = 1
"let g:loaded_getscript         = 1
"let g:loaded_getscriptPlugin   = 1
"let g:loaded_gzip              = 1
"let g:loaded_netrw             = 1
"let g:loaded_netrwFileHandlers = 1
"let g:loaded_netrwPlugin       = 1
"let g:loaded_netrwSettings     = 1
"let g:loaded_rrhelper          = 1
"let g:loaded_tar               = 1
"let g:loaded_tarPlugin         = 1
"let g:loaded_vimball           = 1
"let g:loaded_vimballPlugin     = 1
"let g:loaded_zip               = 1
"let g:loaded_zipPlugin         = 1
" }}}
" Konfekt/FastFold {{{
let g:tex_fold_enabled=1
let g:vimsyn_folding='afP'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
Gautocmdft perl,php,xml,tex,python set foldmethod=syntax
" }}}
" gitgutter: {{{
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_sign_column_always = 1
let g:gitgutter_max_signs = 1000
let g:gitgutter_map_keys = 0
" }}}

" TaskList: {{{
let g:tlTokenList = ['FUCK', 'FIX', 'FIXME', 'TODO', 'XXX', 'WTF', 'OMG', 'OMFG', 'IMPORTANT', 'HACK']
" }}}

" Notes: {{{
let g:notes_directories = ['~/Notes']
" }}}

" NERDCommenter: {{{
let g:NERDCustomDelimiters = {
      \ 'yaml': { 'left': '#'},
      \}
" }}}

" UltiSnips: {{{
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Python docstring style
"let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_style = 'google'
" }}}

" Proteome: {{{
"let g:proteome_plugins = [
"      \ 'proteome.plugins.ctags',
"      \ 'proteome.plugins.history',
"      \ 'proteome.plugins.config',
"      \ ]

"let g:proteome_config_path = '~/.config/projects'

"let g:proteome_base_dirs = [
"      \ expand('~/vk/git'),
"      \ expand('~/code'),
"      \ ]

"let g:proteome_type_base_dirs = {
"      \ '~/.vim': ['vim'],
"      \ }

"ProAdd py3/proxy { "root": expand('~/vk/git/proxy'), "types": ["python"] }
" }}}

" Shada: {{{
"set shada=!,'100,<50,s10,h
set shada=!,'1000,<1000,s100
"set shada+=%
"rshada! ~/.vim/shada
" }}}

" NeoSnippet: {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_conceal_markers = 1
let g:neosnippet#expand_word_boundary = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1
" }}}

" NeoPairs
let g:neopairs#enable = 1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(':DiffOrig')
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" vim-tmuxify
"let g:tmuxify_custom_command = 'tmux split-window -d'
let g:tmuxify_map_prefix = '<leader>m'
let g:tmuxify_global_maps = 0
let g:tmuxify_run = {
      \ 'sh': 'bash %',
      \ 'go': 'go build %',
      \}
"\ 'python': 'pytest',

" Protect header library
Gautocmd BufNewFile,BufRead /System/Library/Frameworks/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode.app/Contents/* setlocal readonly nomodified
Gautocmd BufNewFile,BufRead /Applications/Xcode-beta.app/Contents/* setlocal readonly nomodified

let g:ctrlp_z_nerdtree = 1
let g:ctrlp_extensions = ['Z', 'F']

"nmap <space> <leader>
"imap <silent><space> <leader>

" Allow terminal buffer size to be very large
let g:terminal_scrollback_buffer_size = 100000

set diffopt=filler,icase,iwhite,context:3,vertical

" Always use a new split when opening a file from quickfix
set switchbuf=split

" Number of insert completion lines to show
set pumheight=15

set shortmess+=Ics
"set cmdheight=2
"set noshowmode
let g:echodoc_enable_at_startup = 1

"" Reset search selection map to: <Plug>(clever-f-reset)
"nnoremap <expr><C-l> clever_f#reset() | nohlsearch

"let rst_syntax_code_list = ['vim', 'python']
let g:riv_python_rst_hl = 1

