" NOTE You can reload this file while editing it with ':so %'
" NOTE You can also reload it with :so $MYVIMRC

call pathogen#infect('~/.vim/bundle')
call pathogen#helptags()

syntax on													" Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set nocompatible                  " Must come first because it changes other options.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set modeline                      " Allow per file config
set encoding=utf-8								" UTF-8
set textwidth=79									" set normal border; can unset for coding
set tabstop=2											" The One True Tab (as of latest revision)
set grepprg=ack\ -a								" use ack instead of grep
set laststatus=2									" show statusbar
set modifiable										" modifiable buffers

" syntax highlighting
au BufRead,BufNewFile *.jade set filetype=jade
au BufRead,BufNewFile /opt/local/etc/nginx/* set ft=nginx
au BufNewFile,BufRead *.yaml,*.yml set ft=yaml
au! Syntax jade source /home/louis/.vim/syntax/jade.vim
au! Syntax nginx source /home/louis/.vim/syntax/nginx.vim

" tag my comments with my name and date
iabbr --l -- louis, <C-r>=strftime("%Y-%m-%d")<CR>

" set filetypes based on suffixes
autocmd BufRead *.html,*.htm set ft=html
autocmd BufRead *.php,*.php3 set ft=php
autocmd BufRead *.pl set ft=perl
autocmd BufRead *.js set ft=javascript.jquery

" config for *ruby_runner.txt - https://github.com/henrik/vim-ruby-runner
command! FR set filetype=ruby
let g:RubyRunner_window_size = 15


" T R A I L I N G  W H I T E S P A C E
" ------------------------------------
" highlight them
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display
" Automatically remove them upon saving
autocmd BufWritePre * :%s/\s\+$//e
