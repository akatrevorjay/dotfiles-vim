

" NERDTree {{{
map <Leader>E :NERDTreeToggle<CR>

""autocmd vimenter * NERDTree
"" Add NERDtree by default on new vim runs without any args
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""autocmd vimenter * if !argc() | NERDTree | endif
"" Close vim if NERDTree is the only window left open
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" misc
""let NERDTreeQuitOnOpen=1
"let NERDTreeShowBookmarks=1
""let NERDTreeStatusline=1
"let NERDTreeMinimalUI=1
"let NERDTreeDirArrows=1

"" NERDTress File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
"call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
" }}}
