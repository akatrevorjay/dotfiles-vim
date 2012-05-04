" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"call pathogen#infect()
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes) in terminals

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" I like 4 spaces for indenting
set shiftwidth=4

" I like 4 stops
set tabstop=4

" Number of spaces used for autoindent (local to buffer)
"set sw=4
" Clever autoindenting
"set si
" Indenting for C code
"set cin

" Spaces instead of tabs
set expandtab

" Always  set auto indenting on
set autoindent

" Ignore case in file searches
set ic
" .. Except when we use any upper case in the pattern
set scs

" Highlight the line the cursor is on (local to window)
set cul

"colorscheme elflord
let g:zenburn_high_Contrast=1
set t_Co=256
"colorscheme slate
colorscheme zenburn

" solarized
"let g:solarized_termcolors=256    "default value is 16
"syntax enable
"set background=light
"colorscheme solarized
"map <Leader><F5> :ToggleBG<CR>
""set t_Co=256

"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
"let g:solarized_diffmode="normal"
"let g:solarized_hitrail=0
"let g:solarized_menu=1

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" tab/buffer options
" useopen usetab split newtab
"set switchbuf=usetab,useopen,newtab

" lines
set laststatus=2
set encoding=utf-8
"let Powerline_symbols="unicode"
let Powerline_symbols="fancy"

" Numbers
set number
set numberwidth=5

" Invisibles
"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.
"set listchars=tab:..

" gvim
set guioptions=aegimrLt

" Tab completion options
set wildmode=longest,list
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.pyc,*.swp,*.bak
set complete=.,t

" Keys
set pastetoggle=<Leader>pt
map <Leader>d :NERDTreeToggle<CR>

" minibufexplorer
" default is \mbe, but this is quicker.
"map <Leader>b :let g:miniBufExplSplitBelow=0<cr>:let g:miniBufExplVSplit=0<cr>:TMiniBufExplorer<cr>
"map <Leader>] :let g:miniBufExplSplitBelow=1<cr>:let g:miniBufExplVSplit=1<cr>:TMiniBufExplorer<cr>
"let g:miniBufExplMaxSize=20
map  <Leader>b :TMiniBufExplorer<cr>

" Filetype specifics
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pysmell#Complete

" Folding
if has ('folding')
 set foldenable
" set foldmethod=marker
 set foldmarker={{{,}}}
 set foldcolumn=1
" set foldnestmax=2
set foldmethod=indent
set foldlevel=99

"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

"nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"vnoremap <Space> zf

endif



" FlagIt
map <F1> :FlagIt arrow<CR>
map <F2> :FlagIt function<CR>
map <F3> :FlagIt warning<CR>
map <F4> :FlagIt error<CR>
map <F5> :FlagIt step<CR>

let icons_path = "/home/trevorj/.vim/bundle/flagit/signs/tango/"
let g:Fi_Flags = { "arrow" : [icons_path."16.png", "> ", 1, "texthl=Title"],
                 \ "function" : [icons_path."17.png", "+ ", 0, "texthl=Comment"],
                 \ "warning" : [icons_path."8.png", "! ", 0, "texthl=StatusLine linehl=StatusLine"],
                 \ "error" : [icons_path."4.png", "XX", "true", "texthl=ErrorMsg linehl=ErrorMsg"],
                 \ "step" : [icons_path."5.png", "..", "true", ""] }
let g:Fi_OnlyText = 0
let g:Fi_ShowMenu = 0

" NERDtree
"autocmd vimenter * NERDTree
" Add NERDtree by default on new vim runs without any args
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if NERDTree is the only window left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" misc
let NERDTreeQuitOnOpen=1
let NERDTreeShowBookmarks=1
"let NERDTreeStatusline=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" fugitive (git wrapper)
"set statusline+=%{fugitive#statusline()}

" vim-notes
let g:notes_directory = "~/Notes"

" vimpy
"VimpyLoad ~/.vim/vimpy-projects.index



