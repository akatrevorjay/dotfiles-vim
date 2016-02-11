"" UI
Plug 'bling/vim-airline'
\ | Plug 'edkolev/promptline.vim'
\ | Plug 'ryanoasis/vim-devicons'


"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
cabbrev git Git


"" Python, oh python
" Do not load vim-pyenv until *.py is opened and
" make sure that it is loaded after jedi-vim is loaded.
", {'for': ['python', 'python3']}
Plug 'lambdalisue/vim-pyenv'
\ | Plug 'davidhalter/jedi-vim'

"Plug 'Valloric/YouCompleteMe' | Plug 'rdnetto/YCM-Generator'

" This is only for neovim, wonder if we can check that somehow here and not in
" our hooks
Plug 'Shougo/deoplete.nvim'
\ | Plug 'Shougo/context_filetype.vim'
"| Plug 'zchee/deoplete-go', { 'do': 'make'}
"| Plug 'zchee/deoplete-jedi'


" Support local bundles (manually installed and updated)
"Plug expand('~/.vim/local')
"Plug expand('~/.vim/local/fzf')


"" Productivity
", {'on': 'CtrlP' }
Plug 'ctrlpvim/ctrlp.vim'
\ | Plug 'fisadev/vim-ctrlp-cmdpalette'
"Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'scrooloose/nerdtree'  ", { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'majutsushi/tagbar' ", { 'on': ['TagbarToggle', 'Tagbar'] }
Plug 'sjl/gundo.vim'  ", {'on': 'Gundo' }
Plug 'chrisbra/Recover.vim'
Plug 'vim-scripts/trailing-whitespace'
Plug 'mhinz/vim-startify'

" Approximately converts gui only colorschemes to console
Plug 'godlygeek/csapprox'


" Colors
Plug 'flazz/vim-colorschemes'
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
" Plug 'marcopaganini/mojave-vim-theme'
Plug 'trevorrjohn/vim-obsidian'
Plug 'mhartington/oceanic-next'


"" Syntax checks
Plug 'scrooloose/syntastic' | Plug 'myint/syntastic-extras'


" Syntax
Plug 'fatih/vim-go', {'for': 'go'}

Plug 'saltstack/salt-vim', { 'for': 'sls' }
Plug 'plasticboy/vim-markdown',
    \ {'for': ['mkd', 'md', 'markdown']}
"" BATS test runner and syntax
Plug 'markcornick/vim-bats', {'for': ['bats', 'sh', 'bash', 'shell', 'zsh']}

Plug 'moll/vim-node', {'for': 'javascript'}

"Plug 'ingydotnet/yaml-vim'
"Plug 'veselosky/vim-rst'
"Plug 'nvie/vim-rst-tables'
"Plug 'jtriley/vim-rst-headings'
"Plug 'vim-scripts/ciscoasa.vim'
"Plug 'wlangstroth/vim-haskell'
"Plug 'leshill/vim-json'
"Plug 'juvenn/mustache.vim'
"Plug 'chrisbra/csv.vim'
"Plug 'ekalinin/Dockerfile.vim'
"Plug 'freitass/todo.txt-vim.git'


"" Vetting

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/vim-github-dashboard'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', {
\   'dir': expand('~/.shell/repos/fzf'),
\   'do': './install --bin',
\   'on': 'FZF',
\ }

Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique' | Plug 'junegunn/vim-fnr'
Plug 'rhysd/clever-f.vim'
" Reset map to: <Plug>(clever-f-reset)

Plug 'junegunn/rainbow_parentheses.vim'
"" Activation based on file type
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType lisp,clojure,scheme RainbowParentheses
"augroup END

Plug 'junegunn/vim-xmark', { 'do': 'make' }

" Quoting/parenthesizing made simple
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

" Notes
"Plug 'xolox/vim-notes'
"Plug 'jceb/vim-orgmode'

"Plug 'junegunn/journal'
"Plug 'junegunn/limelight.vim'
"Plug 'junegunn/vim-peekaboo'

"Plug 'vimwiki/vimwiki'  ", {'branch': 'dev'}

"Plug 'groenewege/vim-less', {'for': 'less'}
"autocmd BufNewFile,BufRead *.less setf less

"Plug 'mattn/emmet-vim', {'for': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}}
"autocmd BufNewFile,BufRead *.md setf markdown

"" vimscript for gist
"Plug 'mattn/gist-vim', {'on': 'Gist'}

"" Tmux support with copy/paste with tmux buffers
"Plug 'tpope/vim-tbone.git'

"Plug 'rstacruz/sparkup', {'rtp' : 'vim'}
"Plug 'Raimondi/delimitMate'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'joonty/vdebug'
"Plug 'mattn/emmet-vim'  " Previously known as zencoding

"Plug 'vim-scripts/mru.vim'
"Plug 'xolox/vim-misc'
"Plug 'thinca/vim-prettyprint'
"Plug 'tpope/vim-speeddating'
"Plug 'farseer90718/vim-taskwarrior'
"Plug 'bling/vim-bufferline'
"Plug 'Yggdroot/indentLine'

"" Stuff I never used
" Use neobundle standard recipes.
"Plug 'Shougo/neobundle-vim-recipes', {'force': 1}
"Plug 'Shougo/vimproc', {
"\ 'build' : {
"\     'windows' : 'make -f make_mingw32.mak',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make -f make_mac.mak',
"\     'unix' : 'make -f make_unix.mak',
"\    },
"\ }
"Plug 'Shougo/unite.vim', {'recipe' : 'unite'}
"Plug 'Shougo/neomru.vim'

"" Convert CUI to GUI?
"Plug 'jlund3/colorschemer'

