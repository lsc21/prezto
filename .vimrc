" to reload .vimrc - :so %
set nocompatible                      " Must come first because it changes other options
syntax on                             " Turn on syntax highlighting.
filetype off                          " Turn on file type detection.

set rtp+=~/.vim/bundle/Vundle.vim     " use Vundle
set rtp+=/usr/local/opt/fzf           " use fuzzy finder

set viminfo+=:1000

" V I M  P L U G
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'
Plug 'burnettk/vim-angular'
Plug 'othree/html5.vim'
Plug 'airblade/vim-gitgutter'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'hashivim/vim-terraform'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-terraform'
Plug 'jvirtanen/vim-hcl'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on             " required

" C O L O R  M A N A G E M E N T
" colorscheme base16-default-dark
set background=dark
set term=xterm-256color               " tell vim that its terminal is 256-enabled
set t_Co=256                          " force vim to use 256
let base16colorspace=256              " Access colors present in 256 colorspace

set encoding=utf-8                    " utf-8 support
set termencoding=utf-8                " Terminal utf-8 support
set number                            " show line numbers
set showcmd                           " Display incomplete commands.
set backspace=indent,eol,start        " Intuitive backspacing.
set hidden                            " Handle multiple buffers better.
set wildmenu                          " Enhanced command line completion.
set wildmode=list:longest             " Complete files like a shell.
set incsearch                         " Highlight matches as you type.
set hlsearch                          " Highlight matches.
set wrap                              " Turn on line wrapping.
set shiftwidth=2                      " And again, related.
set modeline                          " Allow per file config
set encoding=utf-8                    " UTF-8
set textwidth=79                      " set normal border; can unset for coding
set modifiable                        " modifiable buffers
set foldlevel=1                       " self-explanatory
set laststatus=2                      " required for airline

set smartindent
set expandtab
set linespace=0
set runtimepath^=~/.vim/bundle/bbye   " Bbye doesn't yet use Vundle
let mapleader = "\<Space>"            " map leader to space
set scrolloff=3                       " this is handy

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'

nnoremap <Leader>q :Bdelete<CR>

" tag my comments with my name and date
iabbr --l -- louis, <C-r>=strftime("%Y-%m-%d")<CR>

" Even quicker setting often-used filetypes.
command! FR set filetype=ruby       " :FR
command! FJ set filetype=javascript " :FJ
command! FV set filetype=vim        " :FV
command! FC set filetype=coffee     " :FC

" make JSON beautiful
command JSON %!python -m json.tool
command JQ %!jq '.'

" >>> Silver Searcher <<<
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind \ (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  " We can map it to any character, such as \:
  nnoremap \ :Ag<SPACE>

endif

" >>> A I R L I N E <<<
let g:airline_detect_paste = 1
let g:airline_detect_iminsert = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline_powerline_fonts=0
let g:airline_detect_crypt=1
let g:airline_symbols_ascii = 1
let g:airline#extensions#branch#vcs_checks = []
let g:airline_minimalist_showmod = 1
let g:airline_theme='base16'

" >>> S Y N T A S T I C <<<
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_mri_exe= $HOME ."/.rbenv/shims/ruby"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" >>> R S P E C <<<
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>
" let g:rspec_command = "!bundle exec rspec --drb {spec}"

" >>> T R A I L I N G  W H I T E S P A C E <<<
" hi link localWhitespaceError Error
" au Syntax * syn match localWhitespaceError /\(\zs\%#\|\s\)\+$/ display
" au Syntax * syn match localWhitespaceError / \+\ze\t/ display
" autocmd BufWritePre * :%s/\s\+$//e
"
" >>> C I R C L E C I  V A L I D A T I O N
au BufWritePost .circleci/config.yml !circleci config validate <afile>

" >>> J S O N  V A L I D A T O R
au BufWritePost package.json !jsonlint -q <afile>

" >>> R U B Y  R U N N E R <<<
" command! FR set filetype=ruby
" let g:RubyRunner_key = '<Leader>r'
" let g:RubyRunner_keep_focus_key = '<Leader>R'
" let g:RubyRunner_open_below = 1
" let g:RubyRunner_window_size = 10

" >>> G I T  G U T T E R <<<
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_override_sign_column_highlight = 0

" >>> P D F <<<
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt

" >>> C O L O R  T W E A K S <<<
" hi Normal guibg=Black guifg=White
hi StatusLine ctermbg=145 ctermfg=59
hi LineNr ctermbg=black
hi Search cterm=NONE ctermfg=black ctermbg=red
hi Folded ctermbg=red ctermfg=black

hi clear SignColumn
hi SignColumn ctermfg=red
hi GitGutterAdd ctermfg=green ctermbg=black
hi GitGutterChange ctermfg=magenta ctermbg=black
hi GitGutterDelete ctermfg=red ctermbg=black
hi GitGutterChangeDelete ctermfg=yellow ctermbg=black
hi CursorLine ctermfg=black ctermbg=red

" >>> T E R R A F O R M <<<
let g:terraform_fold_sections=0

" ###############################################

" >>> T I P S  A N D  T R I C K S <<<

" To change two vertically split windows to horizonally split
" Ctrl-w t Ctrl-w K
"
" Horizontally to vertically:
" Ctrl-w t Ctrl-w H
"
" Recursive search and replace of string
" ag SearchString -l0 | xargs -0 sed -i 's/SearchString/Replacement/g'
"
" Undoing and Redoing
" u = undo
" CTRL-r = redo
" g- = move you to the previous change, regardless where it is situated in your undo tree
" g+ = move you to the following change ...
" 2g- = back 2 changes
" 2g+ = forward 2 changes
" :earlier 2 = 2g-
" :later 2 = 2g+
