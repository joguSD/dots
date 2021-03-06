set nocompatible    " This line must be first or the changes you are expecting

" Required by vundle set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'guns/xterm-color-table.vim'
" Git
Plugin 'tpope/vim-fugitive'
"Fuzzy search
Bundle 'kien/ctrlp.vim'
"Statusbar
Plugin 'bling/vim-airline'
" Whitespace if not in diff mode
if &diff?0:1
  Bundle 'ntpeters/vim-better-whitespace'
endif
if &diff
  let g:airline#extensions#whitespace#enabled = 0
endif
let g:airline_theme = 'jogu'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = 'L'
" Automatically displays all buffers when there's only one tab open.
" let g:airline#extensions#tabline#enabled = 1


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set timeoutlen=1000 ttimeoutlen=0 " Reduce timoute to be more responsive
set noautoread	    " Changing code in another window maintains two versions
set backspace=2     " Allows backspace of indent, eol, and start
set confirm         " Starts dialog when exiting without saving
set title           " filename [+=-] (path) - GVIM
set showmatch       " Show match when inserting {}, [], or ()'s
set showmode        " Display the current mode on the last line
set visualbell      " Screen flash instead of annoying beeping

syntax on

autocmd BufNewFile [Mm]akefile* set formatoptions=croql comments=:#
autocmd BufNewFile .vimrc,*.vim set formatoptions=croql comments=:\"
autocmd FileType c,cpp,java set mps+==:;

:set autowrite          " Automatically save before commands like :next/:make
:set nobackup           " Do not make a backup before overwriting
:set formatoptions=tcrq " How to autoindent
:set nogdefault         " Controls how the search and replace command is used
:set helpheight=40      " Numbers of row the help window will have when opened
:set history=20	        " Stores the last 20 ':' commands
:set noincsearch        " Does not go immediately to pattern typed so far
:set nolist	            " Tabs are not shown as <TABS> and EOL as <EOL>
:set matchtime=2        " Tenths of seconds to show matching pairs
:set mousehide	        " Hides the mouse pointer when typing characters
:set ruler              " Always show position in file
:set scrolloff=12       " Number of lines to keep around cursor
:set shiftround         " Rounds < & > command to the nearest mod of shiftwidth
:set shiftwidth=2       " Indent 4 instead of 8
:set tabstop=2	        " Tab stop is 4 instead of 8
:set expandtab	        " Tabs are extended into spaces
:set smartindent        " Next line indentation is based on previous line
:set splitbelow         " Extra window open below the current window
:set noswapfile	        " No intermidiate files are used when saving
:set textwidth=80       " I do not like going all the way to the edge
:set undolevels=100     " The commands that can be stored in for undo
:set virtualedit=all    " Cursor can go beyond the end of a line
:set wrapmargin=2       " Word wraps 2 character spaces from the margin
:set wildchar=<Tab>     " Character that starts the autocompletion
:set wildmenu           " Shows a list of possible autocompletions
:set wildmode=list      " show list and complete the first match
:set nowritebackup      " No intermidate files when saving

"jogies jogies
:set number
:colorscheme redplanet

"dat bar do
:set laststatus=2
"For diff mode auto resize vertical splits
au VimResized * if &diff | wincmd = | endif

"Restore cursor position
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

set cin
set si
set showmatch

" Ignores files when autocompleting
:set wildignore=*.o,*.bak,*.data,*.class

" Expand tabs in C files to spaces
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=2
au BufRead,BufNewFile *.{c,h,java} set tabstop=2

" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

"Highlight 81st
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
