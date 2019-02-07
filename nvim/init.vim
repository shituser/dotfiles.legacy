"----------------- Visuals -----------------
set termguicolors
colorscheme duotone-darkspace
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_vert_split='bg1'

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm

syntax enable
set background=dark
set number
set relativenumber
set linespace=15
set cc=100
set sw=0
set expandtab
set foldmethod=manual "manual
filetype indent on
"set foldcolumn=1
"set listchars=tab:\|\ 
"set list
"
"Без долните 2 май се ебе GULP-a
set nobackup
set nowritebackup

"----------------- Search ------------------
set hlsearch
set incsearch

"----------------- Mappings ----------------

" General
let mapleader = ','
nmap <Leader>ev :e $MYVIMRC
nmap <Leader><space> :nohlsearch<cr>

" NerdTree
nmap <M-1> :NERDTreeToggle<cr>

" NerdComment
map <M-/> <Leader>c<space> 

" Common sense
map <C-a> <esc>ggVG<cr>
map <C-x> "+x<cr>
nmap <C-s> :w<cr>

" CtrlP
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Emmet
nmap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
imap <expr> <C-e> emmet#expandAbbrIntelligent("\<tab>")

" Indent Lines
nmap <Leader>ig :IndentLinesToggle<cr>
let g:indentLine_enabled = 1
let g:indentLine_color_gui = '#3a4559'
let g:indentLine_char = '→'
"----------------- Split management --------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
"nmap <C-.> <C-W><C->>
"nmap <C-.> <C-W><C-<>
"----------------- Auto commands -----------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source % " Auto source .vimrc
	autocmd BufWritePost init.vim source % " Auto source .vimrc
	autocmd BufRead,BufNewFile /etc/nginx/sites-*/* setfiletype conf

	autocmd Filetype blade setlocal ts=2
	autocmd Filetype blade setlocal sw=2
	
	autocmd Filetype php setlocal ts=4
	autocmd Filetype php setlocal sw=4

	autocmd Filetype ruby setlocal ts=2
	autocmd Filetype ruby setlocal sw=2
	autocmd Filetype eruby setlocal ts=2
	autocmd Filetype eruby setlocal sw=2

	autocmd Filetype css setlocal ts=2
	autocmd Filetype scss setlocal ts=2
	autocmd Filetype html setlocal ts=2
	autocmd Filetype javascript setlocal ts=4

	autocmd Filetype css setlocal sw=2
	autocmd Filetype scss setlocal sw=2
	autocmd Filetype html setlocal sw=2
	autocmd Filetype javascript setlocal sw=4

        autocmd BufRead,BufNewFile *.es6 setfiletype javascript
augroup END

"----------------- Vundle Specific----------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

set laststatus=2 " Airline always present
set encoding=utf-8
let g:airline_theme='base16' " Airline theme
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#checks = ['long']

Plugin 'tpope/vim-fugitive' " Shows git branch in the airline
Plugin 'jwalton512/vim-blade' " Laravel blade support
Plugin 'jiangmiao/auto-pairs' " Auto pair quotes and stuff
Plugin 'tpope/vim-endwise'

Plugin 'mattn/emmet-vim' " Emmet mada faka

Plugin 'scrooloose/nerdcommenter' "Easily comment out or uncomment smth
Plugin 'othree/html5.vim' "Highlight html5 elements
Plugin 'posva/vim-vue' "Vuejs syntax highlighting

Plugin 'terryma/vim-multiple-cursors' "No explanations needed
Plugin 'Yggdroot/indentLine'
"Plugin 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tobyS/vmustache'

"Plugin 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"nmap <leader>es :UltiSnipsEdit<cr>

Plugin 'tobyS/pdv'
"PDV
let g:pdv_template_dir = $HOME . '/.vim/bundle/pdv/templates_snip'
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>;

Plugin 'godlygeek/tabular'

if exists(":Tabularize")
        nmap <Leader>a= :Tabularize /=><CR>
        vmap <Leader>a= :Tabularize /=><CR>
        nmap <Leader>a: :Tabularize /:\zs<CR>
        vmap <Leader>a: :Tabularize /:\zs<CR>
endif

Plugin 'tpope/vim-rails'

Plugin 'Slava/vim-spacebars'

Plugin 'elixir-editors/vim-elixir'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
