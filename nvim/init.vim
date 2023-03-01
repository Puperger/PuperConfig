"VimPlug open Plugins
call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim' 		                        "Theme       
    Plug 'luochen1990/rainbow'                      "bracket coloring

    Plug 'scrooloose/nerdtree'			            "Explorer
    Plug 'ryanoasis/vim-devicons'		            "Explorer-Icons
    Plug 'nvim-tree/nvim-web-devicons'

    Plug 'neoclide/coc.nvim', {'branch': 'release'} "CoC.nvim
    Plug 'nathanaelkane/vim-indent-guides'          "Indent Plugin
    Plug 'jiangmiao/auto-pairs'                     "autoclose brackets
    Plug 'airblade/vim-gitgutter'

    Plug 'mattboehm/vim-accordion'                  "Window Split Manager
    Plug 'farmergreg/vim-lastplace'                 "Safe last position
    Plug 'mhinz/vim-startify'                       "Startup Plugin

    Plug 'freddiehaddad/feline.nvim'                "statusbar
        Plug 'lewis6991/gitsigns.nvim'              "Git Changes
        Plug 'KadoBOT/nvim-spotify',{'do':'make'}   "Spotify Text

    Plug 'nvim-telescope/telescope.nvim',{'tag':'0.1.0'}
        Plug 'nvim-lua/plenary.nvim'                "Telescope


    Plug 'lervag/vimtex'                            "vim Latex
    Plug 'vim-latex/vim-latex'                      "Cool LaTeX

    Plug 'norcalli/nvim-colorizer.lua'              "css color highlighting
    Plug 'iamcco/markdown-preview.nvim'             "markdown previewing
    
    Plug 'karb94/neoscroll.nvim'                    "Smooth Scrolling

    Plug 'dhruvasagar/vim-table-mode'               "Tables
    Plug 'itchyny/calendar.vim'                     "Calendar

    Plug 'folke/noice.nvim'
        Plug 'MunifTanjim/nui.nvim'                 "Good Rendering

call plug#end()

"Set Terminal Layout
if (has("termguicolors"))
 set termguicolors
 colorscheme dracula
endi


syntax enable

"lua
lua require('puperger') 
lua require('colorizer').setup()
lua require('neoscroll').setup()
lua require('noice').setup()

"Hotkeys
nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> <C-q> :NERDTreeFocus<CR>
nnoremap <silent> <C-i> :IndentGuidesToggle<CR>


"Configure Nerdtree + Icons

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

"Close NeoVim if nerdtree is sole thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
let maplocalleader = ","
let g:tex_flavor='biblatex'
set conceallevel=2
let g:tex_conceal='abdmg'

let g:rainbow_active = 1 

"let g:accordion_mode="h"

"Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
source ~/.cache/calendar.vim/credentials.vim

set number relativenumber

filetype plugin indent on
set expandtab ts=4 sw=4 ai

"Make Bg Transparent
highlight Normal guibg=none

set clipboard=unnamedplus
