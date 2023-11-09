" execute pathogen#infect()
" vim-plug

language messages en_US
syntax on
filetype plugin indent on

set redrawtime=10000
set guifont=DroidSansMono\ Nerd\ Font:h12
" set termguicolors
set noeb vb t_vb=
set shell=sh
set encoding=utf-8
set backspace=2
set synmaxcol=500
set number
set nowrap
set linebreak
set incsearch
set hlsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set switchbuf=usetab
set hidden
set nocompatible
set scrolloff=8
set sidescroll=1
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" set autoindent
filetype plugin indent on
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=80
set autoread
set swapfile
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set tags=tags
set tags=./tags,tags;
" set tags=./tags,tags;$HOME
" set autochdir
set wildchar=<Tab> wildmenu wildmode=full
" let $LANG = 'en_US.UTF-8'
set langmenu=en_US.UTF-8
set rtp+=/usr/local/opt/fzf
set nofixeol
set list
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»


" PLUGINS

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'lifepillar/vim-solarized8'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'gioele/vim-autoswap'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/YouCompleteMe', {'do': 'python3 install.py'}
Plug 'mhinz/vim-signify'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'dag/vim-fish'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/webapi-vim'
Plug 'dense-analysis/ale'
Plug 'StanAngeloff/php.vim'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'zivyangll/git-blame.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'haya14busa/incsearch.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'xolox/vim-misc'
Plug 'jamespwilliams/bat.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'jwalton512/vim-blade'
Plug 'github/copilot.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'posva/vim-vue'

call plug#end()

" Python/Django

autocmd FileType python set ft=python.django
autocmd Filetype html set ft=htmldjango


" MAPPINGS

nnoremap <space> <nop>
let mapleader = " "

inoremap <C-Del> <C-\><C-O>D

nnoremap <silent><esc> :let @/ = ""<return><esc>

nnoremap + O<ESC>j
nnoremap d "_d
vnoremap d "_d

nnoremap <leader>cd :cd %:p:h<CR>
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> 8k
nnoremap <Down> 8j


" NETRW
set wildignore=*.pyc
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1
let g:netrw_banner = 0


" GUI

if has("gui_running")
    " colorscheme solarized8_high
    set background=dark
    set guioptions-=T 
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    " autocmd VimEnter * IndentGuidesEnable
else
    autocmd VimEnter * IndentGuidesDisable
endif

" AIRLINE

set laststatus=2
let g:airline_theme = "tomorrow"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

function! AirlineInit()
	let spc = g:airline_symbols.linenr
    let g:airline_section_z = airline#section#create([spc, '%l/%L:%v'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()


" FZF

nmap <silent> <c-space> :Files<cr>
nmap <silent> <space>f :AgCur<cr>
command! -bang -nargs=* AgCur call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


" TAGBAR

nmap <F3> :TagbarToggle<CR>
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 1
let g:tagbar_zoomwidth = 70
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_foldlevel = 0


" UNDOTREE

nnoremap <F4> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1


" INDENT-GUIDES

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1


" YOUCOMPLETEME

nnoremap <silent> <leader>VG :vsplit \| YcmCompleter GoTo<CR>
nnoremap <silent> <leader>G :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>D :YcmCompleter GetDoc<CR>
nmap <leader>h <plug>(YCMHover)

let g:ycm_server_python_interpreter='python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_key_detailed_diagnostics = ''
let g:ycm_use_clangd = 1
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let s:ycm_hover_popup = ''
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_auto_hover=''

" EMMET-VIM, käyttö control + z +,

nnoremap <C-Z> <nop>
let g:user_emmet_leader_key = "<C-Z>"



" ULTISNIP

set runtimepath+=~/.vim/UltiSnips/
let g:UltiSnipsSnippetsDir = '~/UltiSnips/'
let g:UltiSnipsSnippetDirectories = ['/Users/erno/.vim/UltiSnips', "UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"


" SIGNIFY

let g:signify_vcs_list = ["git", "svn"]


" VIM-FISH

compiler fish


" ALE
nnoremap <silent> <leader>vg :vsplit \| ALEGoToDefinition<CR>
nnoremap <silent> <leader>g :ALEGoToDefinition<CR>
nnoremap <silent> <leader>d :ALEHover<CR>

let g:ale_linters = {"python": ["flake8"], "javascript": ["jscs"], "php": ["intelephense", "php"]}
"let g:ale_linters = {"python": ["flake8"], "javascript": ["jscs"], "php": ["intelephense", "php", "phpcs"]}
let g:ale_fixers = {"python": ["isort", "remove_trailing_lines", "trim_whitespace"]}
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 0
let g:ale_hover_cursor = 0
let g:ale_hover_to_preview = 0
let g:ale_set_balloon = 0

augroup ALEGroup
    autocmd!
    autocmd User ALELint AirlineRefresh
    autocmd User ALELint SignifyRefresh
    autocmd User ALELint AirlineRefresh | SignifyRefresh
augroup END


"NERDTree
let g:NERDTreeWinSize=60
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeFind<CR>

"ALE
" nnoremap <leader>

"PDV
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <silent> <leader>P : :call pdv#DocumentWithSnip()<CR>

" Colorscheme
colorscheme jellybeans

"Easymotion

hi EasyMotionTarget ctermfg=Yellow ctermbg=Blue guifg=Yellow guibg=Blue
hi EasyMotionTarget2First ctermfg=Cyan ctermbg=Magenta guifg=Cyan guibg=Magenta
hi EasyMotionTarget2Second ctermfg=Cyan ctermbg=Magenta guifg=Cyan guibg=Magenta
"nmap s <Plug>(easymotion-overwin-f2)

let g:EasyMotion_smartcase = 1
map  s <Plug>(easymotion-sn)
omap s <Plug>(easymotion-tn)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev:
nmap * <Plug>(easymotion-sn)

" Incremental search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" ArgWrap
nnoremap <silent> <leader>z :ArgWrap<CR>

" Vim session
let g:session_autoload = 'no'
