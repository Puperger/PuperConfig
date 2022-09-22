call plug#begin("~/.vim/plugged")
	" Plugin Section
	Plug 'dracula/vim' 		            		    "Theme
	Plug 'scrooloose/nerdtree'			            "Explorer
	Plug 'ryanoasis/vim-devicons'		            "Explorer-Icons
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "CoC.nvim
    Plug 'nathanaelkane/vim-indent-guides'          "Indent Plugin
    Plug 'dhruvasagar/vim-table-mode'               "Tables
    Plug 'marioortizmanero/adoc-pdf-live.nvim'      "Pdf-Viewer
    Plug 'lervag/vimtex'                            "vim Latex
call plug#end()

"Set Terminal Layout
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

"Configure Nerdtree + Icons

let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''



"Close NeoVim if nerdtree is sole thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Add Hotkeys
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-q> :NERDTreeFocus<CR>
nnoremap <silent> <C-i> :IndentGuidesToggle<CR>

"Stop coc from annoying
let g:coc_disable_startup_warning = 1

"Tab autocompletion
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"VimTEX
filetype plugin indent on
syntax enable
let g:vimtex_view_method= 'zathura'
let g:vimtex_compiler_method='latexrun'
let maplocalleader = ","

set number

set expandtab ts=4 sw=4 ai

