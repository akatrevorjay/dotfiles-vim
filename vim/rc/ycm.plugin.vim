
" YCM
Plug 'Valloric/YouCompleteMe',
      \{'build': 'pyenv shell system && python2 ./install.py --clang-completer --gocode-completer --tern-completer' }

" Example: Code to execute when the plugin is loaded on demand
"autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif
"Plug 'rdnetto/YCM-Generator'

