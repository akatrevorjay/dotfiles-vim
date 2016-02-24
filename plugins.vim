
" s:git@github.com:\(.*\).git:'\1':g

" pyenv
runtime rc/pyenv.plugin.vim

""
"" Completions
""

if has('nvim')
  " Python: Jedi
  Plug 'davidhalter/jedi-vim'

  " Deoplete
  runtime rc/deoplete.plugin.nvim
else
  "" YCM
  runtime rc/ycm.plugin.vim
endif

"" Simple, no frills, vimscript-only tab completion
"Plug 'ajh17/VimCompletesMe'
"Gautocmdft python,vim,sh let b:vcm_tab_complete = "tags"

" Complete along all tmux panes
Plug 'wellle/tmux-complete.vim'

"let g:tmuxcomplete#trigger = 'completefunc'
"let g:tmuxcomplete#trigger = 'omnifunc'
" Not needed at all with deoplete/ycm
let g:tmuxcomplete#trigger = ''

""
"" NeoVim
""

if has('nvim')
  "Plug 'bfredl/nvim-ipy'
  "Plug 'tek/proteome.nvim'
endif

""
"" MacVim
""

" TODO Not sure if gui_macvim is only supported in the gui or not in MacVim.
if has('gui_macvim')
  Plug 'nathanaelkane/vim-command-w'
endif

""
"" Tools that are also common libs used by other plugins
""

"" Delete buffer without ever closing a window
Plug 'qpkorr/vim-bufkill'

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
Plug 'airblade/vim-gitgutter'

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
      \   'dir': expand('~/.shell/zsh-plugged/repos/junegunn/fzf'),
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

" Dynamic SQL completion via opening a db connection
Plug 'vim-scripts/dbext.vim'

" Marks
Plug 'kshenoy/vim-signature'

" Multi file search
Plug 'wincent/ferret'

" tmux integration
Plug 'christoomey/vim-tmux-navigator'
" Activate autoupdate on exit
let g:tmux_navigator_save_on_switch = 1

" Help vim out with mouse focus events
Plug 'tmux-plugins/vim-tmux-focus-events'

" Handle tmux panes from vim
Plug 'jebaum/vim-tmuxify'

" Tmux.conf syntax
Plug 'tmux-plugins/vim-tmux'

" Send python tests to tmux split
Plug 'captbaritone/vim-vigilant'
" Control tmux from vim (again) but with tons of support
Plug 'benmills/vimux'
" Run cell blocks of code from vim in tmux
"Plug 'julienr/vim-cellmode'
" Keep env in sync with shell and vim through tmux
Plug 'buztard/vim-nomad'

"" Lots of script helpers at s:_.blah
"Plug 'vim-jp/vital.vim'
"Plug 'haya14busa/underscore.vim'


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
Plug 'ternjs/tern_for_vim'  ", {'for': 'javascript'})

"" BATS test runner and syntax
Plug 'markcornick/vim-bats'  ", {'for': ['bats', 'sh', 'bash', 'shell', 'zsh']}

" Markdown
"Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" Markdown with live preview
Plug 'junegunn/vim-xmark', {'do': 'make', 'for': 'markdown'}

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
Plug 'jceb/vim-orgmode'
", {'branch': 'dev'}
"Plug 'vimwiki/vimwiki'

" Wakatime integration
Plug 'wakatime/vim-wakatime'
"let g:wakatime_PythonBinary = '/usr/bin/python'

" Continuously updated session files
Plug 'tpope/vim-obsession'

" Show CSS colors as what they truely are.
Plug 'ap/vim-css-color'

""
"" UI
""

" Airline + plugins + devicons
Plug 'vim-airline/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Makes the cursorcol match the airline color
Plug 'ntpeters/vim-airline-colornum'

" Approximately converts gui only colorschemes to console
"Plug 'godlygeek/csapprox'

"" Convert CUI to GUI (may be useful in neovim since it needs gui_running to
" NOT be checked yet still supply guifg/guibg etc
"Plug 'jlund3/colorschemer'

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
Plug 'jordwalke/VimCleanColors'
Plug 'jordwalke/flatlandia'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
"Plug 'sbdchd/airline-steve'

