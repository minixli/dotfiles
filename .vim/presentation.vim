" -------------------------------------------------------------------
" Recording / Presentation Mode
" Optimized for screen recording, courseware display, and live demos
" -------------------------------------------------------------------

" Force English messages to avoid mixed-language UI during recording
language messages en_US

" Disable absolute line numbers for a cleaner visual layout
set nonu

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
" - Do NOT set a background color, so the colorscheme's background remains intact
" - Works in both terminal (cterm) and GUI (gui) environments
highlight CursorLine cterm=underline gui=underline ctermbg=NONE guibg=NONE

" Ensure CursorLine underline survives colorscheme changes
augroup CursorLineUnderline
  autocmd!
  autocmd ColorScheme * highlight CursorLine cterm=underline gui=underline guibg=NONE
augroup END

" ------------------------------------------------------------
" Vim Markdown related
" ------------------------------------------------------------

" Tell vim-markdown how to interpret fenced code blocks (```...```) for syntax highlighting.
let g:vim_markdown_fenced_languages = ['jsx=javascript']
