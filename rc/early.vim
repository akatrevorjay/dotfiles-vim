
" Make sure PATH is sane.
if ! exists('s:appended_to_path')
  let sep = has('win32') || has('win64') ? ';' : ':'
  let $PATH = join([
        \ expand('~/.bin'),
        \ expand('~/.local/bin'),
        \ expand('~/.pyenv/bin'),
        \ expand('~/.pyenv/shims'),
        \ expand('~/go/bin'),
        \ '/usr/local/bin',
        \ '/usr/local/sbin',
        \ '/usr/local/libexec/gnubin',
        \ '/usr/bin',
        \ '/usr/sbin',
        \ '/bin',
        \ '/sbin',
        \ $PATH,
        \], sep)
  let s:appended_to_path = 1
endif

" vim-pyenv {{{
"let g:pyenv#pyenv_exec = expand('~/.pyenv/bin/pyenv')
"let g:pyenv#python_exec = expand('~/.pyenv/shims/python')

"if g:pyenv#pyenv#get_activated_env()
"    let g:pyenv#auto_create_ctags = 1 yapf --style google --style='{column_limit: 120, DEDENT_CLOSING_BRACKETS: true}' 
"    let g:pyenv#auto_assign_ctags = 1
"endif
" }}}

if has('nvim')
  "" NeoVim Python

  let g:python3_host_prog  = expand('~/.pyenv/versions/neovim/bin/python3')
  "let g:python_host_prog   = expand('~/.pyenv/versions/neovim2/bin/python2')

  " In order to use any python2 plugins, the *NeoVIM* interpreter must be set to the
  " one it was compiled against. I don't seem to have this issue with python3. Hmm.
  let g:python_host_prog = '/usr/local/bin/python2'
  "let g:python3_host_prog = '/usr/local/bin/python3'

  "" Skip the check of neovim module
  "let g:python3_host_skip_check = 1
  "let g:python_host_skip_check = 1
endif

