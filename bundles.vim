" Support local bundles
"Plug expand('~/.vim/bundle-local')
"Plug expand('~/.vim/bundle-local/fzf')

"" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"" Syntax checks
Plug 'scrooloose/syntastic'
Plug 'myint/syntastic-extras'

"" Python, oh python
" Do not load vim-pyenv until *.py is opened and
" make sure that it is loaded after jedi-vim is loaded.
Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv', {'for': ['python', 'python3']}

" This is only for neovim, wonder if we can check that somehow here and not in
" our hooks
Plug 'Shougo/deoplete.nvim'

"" BATS test runner and syntax
Plug 'markcornick/vim-bats', {'for': ['bats', 'sh', 'bash', 'shell', 'zsh']}

"" Productivity
" Plug 'kien/ctrlp.vim'  ", {'on': 'CtrlP' }
Plug 'ctrlpvim/ctrlp.vim'  " active fork

Plug 'scrooloose/nerdcommenter'
" Plug 'tomtom/tcomment_vim'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'

"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'majutsushi/tagbar' ", { 'on': ['TagbarToggle', 'Tagbar'] }
Plug 'sjl/gundo.vim', {'on': 'Gundo' }
Plug 'chrisbra/Recover.vim'
Plug 'vim-scripts/trailing-whitespace'

"" Vetting
"Plug 'vim-scripts/mru.vim'
"Plug 'vim-scripts/Rainbow-Parentheses-Improved'
"Plug 'xolox/vim-misc'
"Plug 'thinca/vim-prettyprint'
"Plug 'tpope/vim-speeddating'
"Plug 'tpope/vim-surround'
"Plug 'farseer90718/vim-taskwarrior'
"Plug 'bling/vim-bufferline'
"Plug 'MarcWeber/vim-addon-signs'
"Plug 'tomtom/quickfixsigns_vim'

"Plug 'rstacruz/sparkup', {'rtp' : 'vim'}
"Plug 'Raimondi/delimitMate'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'joonty/vdebug'
"Plug 'mattn/emmet-vim'  " Previously known as zencoding

" Notes
"Plug 'xolox/vim-notes'
"Plug 'jceb/vim-orgmode'

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

" Syntax
Plug 'saltstack/salt-vim', { 'for': 'sls' }
Plug 'fatih/vim-go', {'for': 'go'}

"Plug 'ingydotnet/yaml-vim'
"Plug 'veselosky/vim-rst'
"Plug 'nvie/vim-rst-tables'
"Plug 'jtriley/vim-rst-headings'
"Plug 'vim-scripts/ciscoasa.vim'
"Plug 'wlangstroth/vim-haskell'
"Plug 'leshill/vim-json'
"Plug 'juvenn/mustache.vim'
"Plug 'tpope/vim-markdown'
Plug 'plasticboy/vim-markdown', {'for': ['mkd', 'md', 'markdown']}
"Plug 'chrisbra/csv.vim'
"Plug 'ekalinin/Dockerfile.vim'

" Todo.txt
"Plug 'freitass/todo.txt-vim.git'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/vim-github-dashboard'

"" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

"" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', {
\   'dir': expand('~/.shell/repos/fzf'),
\   'do': './install --bin',
\ }

"" Unmanaged plugin (manually installed and updated)
"Plug '~/.vim/bundle-local/fzf'



"" UI
Plug 'bling/vim-airline'
\ | Plug 'edkolev/promptline.vim'
\ | Plug 'ryanoasis/vim-devicons'  " Pretty iconize everything

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

