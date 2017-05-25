set nocompatible                  " Must come first because it changes other options.

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'msanders/snipmate.vim'
Plugin 'syncrou/vim-flog'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'danro/rename.vim'
Plugin 'airblade/vim-rooter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/taglist.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'ngmy/vim-rubocop'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Turn on pathogen
"execute pathogen#infect()        

syntax enable                     " Turn on syntax highlighting.

runtime macros/matchit.vim        " Load the matchit plugin.

" Flog-vim plugin settings
:silent exe "g:flog_enable"
":silent exe "let g:flog_low_color=#a5c261"
":silent exe "let g:flog_medium_color=#ffc66d"
":silent exe "let g:flog_high_color=#cc7833"
":silent exe "let g:flog_background_color=#323232"
":silent exe "let g:flog_medium_limit=10"
":silent exe "let g:flog_high_limit=20"
let g:syntastic_javascript_checkers = ['jshint']


set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
"set autoindent " always set autoindenting on -- not sure I want this
set bg=light

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
"set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs


set laststatus=2                  " Show the status line all the time

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Or use vividchalk
"colorscheme vividchalk
colorscheme dark-ruby

let g:ctrlp_map = '<c-p>'         " Set CtrlP's invoke to be <c-p> or :CtrlP        
let g:ctrlp_cmd = 'CtrlP'


" Set buffer explorer to only show relative paths

let g:bufExplorerShowRelativePath=1

" Set up makegreen auto compiler for rubyunit
"autocmd BufNewFile,BufRead *_test.rb compiler rubyunit

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" C- mappings
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Other stuff in alphabetical order
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>bb :!bundle install<cr>
map <Leader>c :!rails c<cr>
map <Leader>d Odebugger<esc>:w<cr>
map <Leader>gd :Git diff<cr>
map <Leader>gs :Git status<cr>
map <Leader>gw :!git add . && git commit -m 'WIP' && git pull --rebase && git push<cr>
map <Leader>i :!irb<cr>
map <Leader>con :!bin/console<cr>
map <leader>nt :NERDTree<cr>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
map <Leader>rc :RuboCop<cr>
map <Leader>sn :e ~/.vim/bundle/snipmate.vim/snippets/ruby.snippets<CR>
map <Leader>st :!DEBUG=true ruby -Itest % -n "//"<left><left>
map <Leader>t :w<cr>:call RunCurrentTest()<CR>

"Automatically rebuild cTags after every save
autocmd BufWritePost *.cpp :TlistUpdate

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
" autocmd FileType javascript setlocal foldmethod=syntax

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
    if in_test_file
      call SetTestFile()

      if match(expand('%'), '\.feature$') != -1
        call SetTestRunner("!bin/cucumber")
        exec g:bjo_test_runner g:bjo_test_file
      elseif match(expand('%'), '_spec\.rb$') != -1
        call SetTestRunner("!rspec")
        exec g:bjo_test_runner g:bjo_test_file
      else
        call SetTestRunner("!ruby -Itest")
        exec g:bjo_test_runner g:bjo_test_file
      endif
    else
      exec g:bjo_test_runner g:bjo_test_file
    endif
endfunction

function! SetTestRunner(runner)
    let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Remove trailing whitespace on save for ruby and python files.
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.py :%s/\s\+$//e
