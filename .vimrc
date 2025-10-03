"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
"
" The default vimrc file is in this directory: /usr/local/share/vim/vim90/
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" All code below is added by Minix Li
"
" Some configuration is learned from tips in the book: "Practical Vim"

" If working with octal numbers frequently, we should comment out this line.
"
" @see Tip 10
set nrformats= 

" Show line numbers.
set number

" Fix the behavior of autocompletion for word list caused by
" enabling 'ignorecase'.
set infercase

" Allow using the :next, :bnext, :cnext (and so on) commands without a
" trailing bang.
"
" @see Tip 38
set hidden

" Now when we type %% on Vim’s : command-line prompt, it automatically expands 
" to the path of the active buffer, just as though we had typed %:h<Tab>.
"
" @see Tip 41
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Set the comma key as leader and mapping the reverse character search command
" to another key.
"
" @see Tip 49
let mapleader=","
noremap \ ,

" Center the next match (forward or backword) item in the middle of the display.
"
" @see Tip 49
noremap <Leader>n nzz
noremap <Leader>N Nzz

" Making & trigger the :&& command is more useful. It preserves flags and
" therefore produces more consistent results. These mappings fix the & command
" in Normal mode and create a Visual mode equivalent
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Normally, <C-l> clears and redraws the screen. This mapping builds on top of
" the usual behavior by muting search highlighting.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" This tells Vim to show a preview of the first match based on what has been
" entered so far into the search field.
"
" @see Tip 81
set incsearch

" Using pathogen to manage our 'runtimepath' with ease.
" execute pathogen#infect()

" Tools to make Vim superb for developing with Node.js.
" This is a Vim bundle which is no longer maintained. It seems age-old but may be
" useful. It doesn't work with vim-plug, so I have to install it mannually.
set runtimepath^=~/.vim/bundle/node

" This plugin adds a custom command called :Subvert (or :S for short), which acts
" like a supercharged version of Vim’s :substitute command.  It doesn't work with
" vim-plug, so I have to install it mannually.
set runtimepath^=~/.vim/bundle/vim-abolish

" Don't let long lines wrap.
set wrap!

" For convenience when using :find.
"
" @see Tip 42
set path+=**/

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
" Add two text objects for entire buffer: ae and ie.
"
" @see Tip 12
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-qargs'
Plug 'nelstrom/vim-visual-star-search'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" Type gc to comment stuff out.
"
" @see Tip 12
Plug 'tpope/vim-commentary'
" Provides mappings to easily delete, change and add such surroundings in pairs.
"
" @see Tip 54
Plug 'tpope/vim-surround'
" Pairs of bracket mappings which are short normal mode aliases for commonly
" used Ex commands. [b is :bprevious, ]b is :bnext, etc.
"
" @see Tip 36
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Provides functions to change indentation configuration quickly.
Plug 'MarioRicalde/stab.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Automatically configure indentation for my common programming languages.
au FileType c                   call StabSoft(4)
au FileType html                call StabSoft(2)
au FileType javascript          call StabSoft(2)
au FileType json                call StabSoft(2)
au FileType python              call StabSoft(2)
au FileType ruby                call StabSoft(2)
au FileType typescriptreact     call StabSoft(2)

" Here is a list of color scheme each of which enjoys me: 1989, 256-grayvim,
" brighton, happy_hacking, PaperColor, railscasts, termschool, ubaryd,
" wasabi256, xoria256, zellner.
colorscheme BlackSea

" and the theme for vim-airline (status/tabline beautifier) to distinguished.
let g:airline_theme='distinguished'
" Enable the vim-airline tab line extension
let g:airline#extensions#tabline#enabled = 1
" and choose which path formatter airline uses.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Disable code syntax checking and repairing functionality.
" We can use :ALEEnable to enable it.
let g:ale_enabled = 0

" Store backup, swap, and undo files in ~/.vim/tmp to keep workspace clean
set backupdir=~/.vim/tmp/    " Directory for backup files (*~)
set directory=~/.vim/tmp/    " Directory for swap files (*.swp)
set undodir=~/.vim/tmp/      " Directory for persistent undo files
