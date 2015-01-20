set nocompatible                  " Must come first because it changes other options
syntax on                         " Turn on syntax highlighting.
filetype off                      " Turn on file type detection.

set rtp+=~/.vim/bundle/Vundle.vim " use Vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'       " control git from within vim
Plugin 'tpope/vim-rails'          " Ruby on Rails power tools
Plugin 'vim-ruby/vim-ruby'        " Vim/Ruby Configuration Files
Plugin 'thoughtbot/vim-rspec'     " Run Rspec specs from Vim
Plugin 'kien/ctrlp.vim'           " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'mileszs/ack.vim'          " Vim plugin for Perl's 'ack'
Plugin 'scrooloose/syntastic'     " Syntax checking hacks for vim
Plugin 'tpope/vim-surround'       " quoting/parenthesizing made simple
Plugin 'bling/vim-airline'        " lean & mean status/tabline

call vundle#end()                 " required for Vundle
filetype plugin indent on         " required

set background=dark               " dark background by default
set term=xterm-256color           " tell vim that its terminal is 256-enabled
set t_Co=256                      " force vim to use 256

set encoding=utf-8                " utf-8 support
set termencoding=utf-8            " Terminal utf-8 support
set number                        " show line numbers
set showcmd                       " Display incomplete commands.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set shiftwidth=2                  " And again, related.
set modeline                      " Allow per file config
set encoding=utf-8                " UTF-8
set textwidth=79                  " set normal border; can unset for coding
set tabstop=2                     " The One True Tab (as of latest revision)
set modifiable                    " modifiable buffers
set foldlevel=1                   " self-explanatory
set laststatus=2                  " required for airline

" tabs instead of spaces
set smartindent
set expandtab
set linespace=0

" >>> C O L O R <<<
colorscheme smyck

" >>> A I R L I N E <<<
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0

" >>> S Y N T A S T I C <<<
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" >>> V I E W S <<<
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" >>> T R A I L I N G  W H I T E S P A C E <<<
hi link localWhitespaceError Error
au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
au Syntax * syn match localWhitespaceError / \+\ze\t/ display
autocmd BufWritePre * :%s/\s\+$//e

" tag my comments with my name and date
iabbr --l -- louis, <C-r>=strftime("%Y-%m-%d")<CR>

highlight LineNr ctermfg=blue ctermbg=black
