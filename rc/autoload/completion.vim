" Completion: {{{

" Wild: completion options {{{
set wildchar=<Tab>
set wildmenu
"set wildmode=longest,list
"set wildmode=longest:full,list:longest,list:full
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.swo,*.bak,*.pyo,*.pyc,*.svn,*/tmp/*,__pycache__,sdist,bdist,dist,build,*.egg-info
set wildoptions=tagfile
" }}}

" Code complete
"inoremap <Nul> <C-x><C-o>

"set complete=.,t
set completeopt=menuone,longest,preview,noinsert,noselect

" Python omni is handled by Jedi <3
"Gautocmdft python setlocal omnifunc=pythoncomplete#Complete
"Gautocmdft python setlocal completefunc=pythoncomplete#Complete
Gautocmdft php setlocal omnifunc=phpcomplete#CompletePHP
Gautocmdft css setlocal omnifunc=csscomplete#CompleteCSS
Gautocmdft html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
Gautocmdft xml setlocal omnifunc=xmlcomplete#CompleteTags
Gautocmdft javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" TODO default to syntaxcomplete#Complete
"set completefunc=syntaxcomplete#Complete
"set omnifunc=syntaxcomplete#Complete

"" Completion: Jedi {{{
let g:loaded_deoplete_enabled = 0
let g:loaded_deoplete_enabled_auto = 0

if has('nvim')
  if exists('g:loaded_deoplete') && g:loaded_deoplete == 1
    let g:loaded_deoplete_enabled = deoplete#init#is_enabled()

    if g:deoplete#enable_at_startup == 1
      let g:loaded_deoplete_enabled_auto = 1
    endif
  endif
endif

if g:loaded_deoplete_enabled == 1
  "" jedi for deoplete
  "Gautocmdft python setlocal omnifunc=jedi#completions
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#popup_on_dot = 0
  let g:jedi#popup_select_first = 0
  let g:jedi#completions_enabled = 0
  "let g:jedi#force_py_version = 3
  "let g:jedi#smart_auto_mappings = 0
  let g:jedi#show_call_signatures = 2  " show in cmdline
  let g:jedi#show_call_signatures_delay = 250  " ms (500)
  "let g:jedi#max_doc_height = 100

  "if !exists('g:deoplete#force_omni_input_patterns')
  "  let g:deoplete#force_omni_input_patterns = {}
  "endif
  "let g:deoplete#force_omni_input_patterns.python =
  "      \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

else  " Not deoplete
  let g:jedi#auto_initialization = 1
  let g:jedi#use_tabs_not_buffers = 1
  let g:jedi#use_splits_not_buffers = 'left'
  let g:jedi#use_splits_not_buffers = 1
  let g:jedi#popup_on_dot = 1
  let g:jedi#popup_select_first = 0
  " Jedi displays function call signatures in insert mode in real-time, highlighting the current argument.
  " The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the
  " advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2),
  " which can improve the integrity of Vim's undo history.
  let g:jedi#max_doc_height = 30
  let g:jedi#auto_close_doc = 0
  "let g:jedi#squelch_py_warning = 1
  let g:jedi#goto_definitions_command = '<leader>gg'

  "let g:jedi#show_call_signatures = 1
  let g:jedi#show_call_signatures = 2  " show in cmdline
  let g:jedi#show_call_signatures_delay = 250  " ms (500)

  " Default mappings:
  "let g:jedi#goto_command = "<leader>d"
  "let g:jedi#goto_assignments_command = "<leader>g"
  "let g:jedi#documentation_command = "K"
  "let g:jedi#usages_command = "<leader>n"
  "let g:jedi#completions_command = "<C-Space>"
  "let g:jedi#rename_command = "<leader>r"

  "inoremap <F2> <ESC>K!i
endif
" }}}

"" From github: zchee/deoplete-go
" neocomplete like
" https://github.com/Shougo/deoplete.nvim/blob/master/doc/deoplete.txt
set completeopt+=noinsert

" Set before than deoplete
" deoplete#mappings#_set_completeopt() in
" https://github.com/Shougo/deoplete.nvim/blob/master/autoload/deoplete/mappings.vim
" https://github.com/Shougo/deoplete.nvim/blob/master/rplugin/python3/deoplete/deoplete.py
"set completeopt+=noselect

" Deoplete: {{{

if g:loaded_deoplete_enabled == 1
  "let g:deoplete#auto_completion_start_length = 1
  "let g:deoplete#file#enable_buffer_path = 1
  ""let g:deoplete#enable_refresh_always = 1

  " Use smartcase.
  let g:deoplete#enable_smart_case = 1

  " Use head matcher instead of fuzzy matcher
  "call deoplete#custom#set('_', 'matchers', ['matcher_head'])
  call deoplete#custom#set('_', 'matchers', ['matcher_head', 'matcher_full_fuzzy'])
  " Use auto delimiter feature
  call deoplete#custom#set('_', 'converters', ['converter_auto_delimiter', 'converter_remove_overlap', 'converter_auto_paren'])

  "call deoplete#custom#set('buffer', 'min_pattern_length', 9999)
  " Change the source rank
  "call deoplete#custom#set('buffer', 'rank', 9999)
  " Enable buffer source in C/C++ files only.
  call deoplete#custom#set('buffer', 'filetypes', ['c', 'cpp'])
  " Disable the candidates in Comment/String syntaxes.
  "call deoplete#custom#set('_', 'disabled_syntaxes', ['Comment', 'String'])

  " Integrate with neopairs
  let g:deoplete#enable_auto_pairs = 'true'

  "let g:deoplete#sources = {}
  ""let g:deoplete#sources._ = ['buffer', 'tag']
  "let g:deoplete#sources._ = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.python = ['omni', 'member', 'buffer', 'tag']
  ""let g:deoplete#sources.cpp = ['buffer', 'tag']

  "" Go for deoplete
  let g:deoplete#sources#go = 'vim-go'
  let g:deoplete#sources#python = 'jedi'
  "let g:deoplete#sources#vim = 'neco'


  " Keys

  "" <C-h>, <BS>: close popup and delete backword char.
  "inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  "inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

  " Allow <CR> to select
  inoremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"

  "" <CR>: close popup and save indent.
  "inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  "function! s:my_cr_function() abort
  "  return deoplete#mappings#close_popup() . "\<CR>"
  "endfunction
endif
" }}}

" Clang: {{{
if g:loaded_deoplete_enabled == 1
  " Deoplete support
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_omnicppcomplete_compliance = 0
  let g:clang_make_default_keymappings = 0
  "let g:clang_use_library = 1
endif
" }}}

" }}}
