
runtime! bundles-pre.vim
if has('nvim')
  runtime! bundles-pre.nvim
endif

""
"" Completions
""

" Python: Jedi
Plug 'davidhalter/jedi-vim'

" Deoplete
" (moved to bundles-pre.nvim)

" YCM
"Plug 'Valloric/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator'

" Example: Code to execute when the plugin is loaded on demand
"Plug 'Valloric/YouCompleteMe'  ", { 'for': 'cpp' }
"autocmd! User YouCompleteMe if !has('vim_starting') | call youcompleteme#Enable() | endif

""
"" Tools that are also common libs used by other plugins
""

"" Ultimate Text Linker
Plug 'vim-scripts/utl.vim'

"" Quoting/parenthesizing made simple
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"" Quick date changes
Plug 'tpope/vim-speeddating'

" Reqd by Taskwarrior
Plug 'xolox/vim-misc'

"" Git
Plug 'tpope/vim-fugitive'
"cabbrev git Git

"" CtrlP and plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'

"" NERD stuff
" turned off autoloading as other plugins interface with it
", { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'

" Great bindings for switching buffers and more
Plug 'tpope/vim-unimpaired'

"" Syntastic: automagic syntax checks
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

"Plug 'thinca/vim-prettyprint'

Plug 'mattn/emmet-vim', {'for': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}
"autocmd BufNewFile,BufRead *.md setf markdown

""
"" Tools
""

" Nice start screen
Plug 'mhinz/vim-startify'

"" GitGutter: Show git status in the gutter
"Plug 'airblade/vim-gitgutter'

"" NERDCommenter: stuff
Plug 'scrooloose/nerdcommenter'

" Fix trailing whitespace:
Plug 'vim-scripts/trailing-whitespace'

"" Autoformat: supports numerous filetypes
Plug 'Chiel92/vim-autoformat'

" Faster folding
Plug 'Konfekt/FastFold'

" Taskwarrior: Fucking sick ftw
Plug 'farseer90718/vim-taskwarrior'  ", {'on': ['TW', 'TWAdd']}

" Gundo: Undo browser
Plug 'sjl/gundo.vim'  ", {'on': 'Gundo' }

"" Snippets:
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'StephenPCG/vim-snippets-salt'

" Outlines (uses utl)
Plug 'vim-voom/VOoM'

"" Fuzzy File Finder (kinda like ctrlp but ~maybe~ faster and less features?)
Plug 'junegunn/fzf', {
      \   'dir': expand('~/.shell/repos/fzf'),
      \   'on': 'FZF',
      \ }


""
"" Tools: Vetting
""

" Superb motion controls
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
"Plug 'junegunn/vim-fnr'

" Make f usable and more powerful
", {'on': '<Plug>'}
Plug 'rhysd/clever-f.vim'

"" RainbowParantheses
Plug 'junegunn/rainbow_parentheses.vim'
" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

Plug 'vim-scripts/restore_view.vim'

Plug 'Shougo/neopairs.vim'
Plug 'Shougo/echodoc.vim'

"Plug 'Shougo/vimproc', {
"      \ 'build' : {
"      \     'windows' : 'make -f make_mingw32.mak',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }

" Dynamic SQL completion via opening a db connection
Plug 'vim-scripts/dbext.vim'

""
"" Language: Python
""

" Run pytest, integrate a bit
Plug 'alfredodeza/pytest.vim'  ", {'on': 'Pytest'}

""
"" Syntax
""

" Allows for python rst docstring support
Plug 'Rykka/riv.vim'

" Better json
Plug 'elzr/vim-json'

" AWS CloudFormation
Plug 'm-kat/aws-vim'

" Go
Plug 'fatih/vim-go'  ", {'for': ['go', 'gotexttmpl', 'gohtmltmpl']}

" Clang
" Supports deoplete source
Plug 'Rip-Rip/clang_complete'
"Plug 'osyo-manga/vim-marching'

"" Ruby
"Plug 'osyo-manga/vim-monster'

" Javascript
"Plug 'moll/vim-node'  ", {'for': 'javascript'}
"Plug 'ternjs/tern_for_vim'  ", {'for': 'javascript'})

"" BATS test runner and syntax
Plug 'markcornick/vim-bats'  ", {'for': ['bats', 'sh', 'bash', 'shell', 'zsh']}

" Markdown
Plug 'plasticboy/vim-markdown'  ", {'for': ['mkd', 'md', 'markdown']}
"" Markdown with live preview
"Plug 'junegunn/vim-xmark'  ", { 'do': 'make' }

"" YAML: is it better syntax? What is this?
Plug 'ingydotnet/yaml-vim'  ", {'for': 'yaml'}

" Salt
Plug 'saltstack/salt-vim'  ", { 'for': 'sls' }

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" TOML
Plug 'cespare/vim-toml'

""
"" Syntax: Vetting
""

" Format any txt file
Plug 'vim-scripts/Txtfmt-The-Vim-Highlighter'

" Notes
Plug 'xolox/vim-notes'
"Plug 'jceb/vim-orgmode'
", {'branch': 'dev'}
"Plug 'vimwiki/vimwiki'

""
"" UI
""

" Airline + plugins + devicons
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'ryanoasis/vim-devicons'

" Approximately converts gui only colorschemes to console
"Plug 'godlygeek/csapprox'

"" Convert CUI to GUI (may be useful in neovim since it needs gui_running to
" NOT be checked yet still supply guifg/guibg etc
Plug 'jlund3/colorschemer'

""
"" Colors
""

"Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/tropikos'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/badwolf'
Plug 'Pychimp/vim-luna'
Plug 'jonathanfilip/vim-lucius'
Plug 'trapd00r/neverland-vim-theme'
Plug 'noahfrederick/Hemisu'
Plug 'zaiste/Atom'
Plug 'ratazzi/blackboard.vim'
Plug 'effkay/argonaut.vim'
Plug 'jedverity/feral-vim'
Plug 'stephanedemotte/beekai'
Plug 'marcopaganini/mojave-vim-theme'
Plug 'trevorrjohn/vim-obsidian'
Plug 'mhartington/oceanic-next'

