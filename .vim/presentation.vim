" -------------------------------------------------------------------
" Recording / Presentation Mode
" Optimized for screen recording, courseware display, and live demos
" -------------------------------------------------------------------

" Force English messages to avoid mixed-language UI during recording
language messages en_US

" Disable absolute line numbers for a cleaner visual layout
set nonu

" Disable line wrapping so each logical line stays on a single visual line
set wrap!

" Use different cursor shapes for different modes
let &t_SI = "\e[6 q"   " Insert mode: vertical bar
let &t_EI = "\e[2 q"   " Normal mode: block

" -------------------------------------------------------------------
" Colorschemes
"
" gruvbox   : used for courseware / slides split window
" getfresh  : used for transcript / narration split window
" Switch manually depending on the active recording layout
" -------------------------------------------------------------------

" colorscheme gruvbox
" colorscheme tokyonight
" colorscheme getfresh

" -------------------------------------------------------------------
" UI Minimization (Vim-Airline and related elements)
" -------------------------------------------------------------------

" Completely disable vim-airline statusline rendering
let g:airline_disable_statusline = 1

" Disable airline tabline extension (buffer / tab indicators)
let g:airline#extensions#tabline#enabled = 0

" Hide Vim's built-in tab/buffer line for clean screen capture
set showtabline=0

" Hide all statuslines to achieve a distraction-free, content-first view
" (Note: window separators may still exist and are handled separately)
set laststatus=0

" ------------------------------------------------------------
" CursorLine: Use underline instead of background highlight
" ------------------------------------------------------------

" Enable highlighting of the current cursor line
set cursorline

" Define CursorLine style:
" - Use underline to mark the active line
" - Works in both terminal (cterm) and GUI (gui) environments
highlight CursorLine cterm=underline gui=underline ctermbg=236 guibg=#3c3836

" Ensure CursorLine underline survives colorscheme changes
augroup CursorLineUnderline
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=underline gui=underline guibg=#3c3836
augroup END
