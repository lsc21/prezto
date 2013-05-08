" NOTE You can reload this file while editing it with ':so %'
" NOTE You can also reload it with :so $MYVIMRC

call pathogen#infect()
call pathogen#helptags()
call pathogen#incubate()

syntax on													" Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set term=xterm-256color 					" xterm 256 color support
set encoding=utf-8								" utf-8 support
set termencoding=utf-8						" Terminal utf-8 support
set nocompatible                  " Must come first because it changes other options
set number                        " show line numbers
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set shiftwidth=2                  " And again, related.
set modeline                      " Allow per file config
set encoding=utf-8								" UTF-8
set textwidth=79									" set normal border; can unset for coding
set tabstop=2											" The One True Tab (as of latest revision)
set grepprg=ack\ -a								" use ack instead of grep
set laststatus=2									" show statusbar
set modifiable										" modifiable buffers
set t_Co=256											" Use 256 colors

" tabs instead of spaces
set smartindent
set expandtab

" Use ctrlp: http://kien.github.com/ctrlp.vim/
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Load powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" syntax highlighting
au BufRead,BufNewFile /opt/local/etc/nginx/* set ft=nginx
au BufNewFile,BufRead *.yaml,*.yml setf yaml
au! Syntax nginx source /home/louis/.vim/syntax/nginx.vim

" tag my comments with my name and date
iabbr --l -- louis, <C-r>=strftime("%Y-%m-%d")<CR>

" config for *ruby_runner.txt - https://github.com/henrik/vim-ruby-runner
command! FR set filetype=ruby
let g:RubyRunner_window_size = 15

" +++++++++++++++++++++++++++++++++
" Trailing Whitespace is the Devil!
" =================================
" highlight them
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display
" Automatically remove them upon saving
autocmd BufWritePre * :%s/\s\+$//e
