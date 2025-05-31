""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 	" not vi compatible
set shortmess+=I 	" Disable the default Vim startup message
set noerrorbells visualbell t_vb=   " Disable audible bell

filetype indent on	" enable file type detection, and use corresponding indent
filetype plugin on	" set load plugin by file type
syntax enable		" highlight enable
syntax on  			" highlight auto
set t_Co=256        " use 256 color

set ruler           " show current position in the status 
set cursorline		" highlight current line

set number   		" number lines
set relativenumber 	" relative number lines
set laststatus=2  	" always show the status line at the buttom

set backspace=indent,eol,start 	" allow backspacing over everything
set whichwrap+=h,l  " set the cursor keys across rows
set matchpairs+=<:> " allow % jump between <>
set background=dark " set background color

set mouse+=a        " Enable mouse support
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
let mapleader=" "
" having longer updatetime brings noticable delays and poor user experience
set updatetime=100  
" Always show the signcolumn(the margin in the left), otherwise it would shift 
" the text each time diagnostics appear/become resolved(coc)
set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd 		" display inputting commands
set autoindent 		" copy indent from current line when starting a new line 

" show indent line
set list
set listchars=tab:\ \ ,leadmultispace:▸···,multispace:\ \ 

set tabstop=4       " the size of tab
set expandtab		" replace tab with spaces
set softtabstop=4	" 1 tab == 4 spaces
set shiftwidth=4	" shift size when using '<<' or '>>'

set textwidth=80    " the width of each line
set wrap            " break lines automatically
set linebreak       " break only when encountering with specific character
set scrolloff=15
match ErrorMsg '\%>80v.\+'	" highlight the characters above 80

set undofile                " create undo file
set undodir=~/.vim/.undo//
set history=200             " record 100 operations

" change window size
" they don't work now
nnoremap <C-k> <C-w>+
nnoremap <C-j> <C-w>-
nnoremap <C-h> <C-w><
nnoremap <C-l> <C-w>>

" shift between windows
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l

nnoremap <leader><leader>p "0p  " save what you yank, even after you delete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase 		" smart case-sensitive search
set smartcase 		
set incsearch 		" searching as you type
set nohlsearch      " nohighlight after search

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cache and buffer config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                " don't create backup file
set nowritebackup           " No backup made
set noswapfile              " don't create temp file

set autochdir               " change directory when open a new file
set autoread                " when editing files are changed in other place
set hidden 			        " enable to hidden buffers without saving

" wildchar is <TAB> by default
set wildmenu
set wildmode=longest,list

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" encode config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8    " set language menu encode utf8
set helplang=cn             " set helping language Chinese

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" binding config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unbind some useless/annoying default key bindings.
nmap Q <Nop>

" Have j and k navigate visual lines rather than logical lines
" Sometimes it will cause relative numbers inaccurate
nmap j gj   
nmap k gk

" reload .vimrc
nnoremap <Leader><Leader>s :w <CR> :source $MYVIMRC<CR>
" install and clean plug
nnoremap <Leader><Leader>i :PlugInstall<CR>
nnoremap <Leader><Leader>c :PlugClean<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plug list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'	    " F8, file construction, like vars, funcs, etc.
Plug 'scrooloose/nerdtree'      " <C-n>, directory overview    
Plug 'jiangmiao/auto-pairs'
" vim themes
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'		" move as fast as you want!
Plug 'vim-python/python-syntax', {'for': 'py'}  " python syntax highlight
Plug 'Yggdroot/LeaderF', {'do': ':LeaderfInstallCExtension'}    " search file
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}  " align easily
" Plug 'chxuan/prepare-code'
" change surround quickly
Plug 'tpope/vim-surround'
" add comments quickly
Plug 'tpope/vim-commentary'
" cpp highlight
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
" enhance f/t
Plug 'rhysd/clever-f.vim'
Plug 'frazrepo/vim-rainbow'     " rainbow parenthesis
" markdown preview
" iamcco/markdown-preview.nvim doesn't support vim in wsl terminal
" trying JamshedVesuna/vim-markdown-preview, but failed
" trying instant-markdown/vim-instant-markdown, but failed
" Plug 'instant-markdown/vim-instant-markdown', 
"	{'for': 'markdown', 'do': 'yarn install'}
call plug#end()


" LeaderF settings
let g:Lf_ShortcutF = '<C-p>'
" End LeaderF settings


" tagbar settings
" Press F8 to see the construction of the file
map <F8> :TagbarToggle<CR>
let g:tagbar_width = 22
let g:tagbar_ctags_bin  = 'ctags'
let g:tagbar_autofocus  = 1
let g:tagbar_left		= 1
let g:tagbar_sort		= 0
" End tagbar settings


" Nerdtree Settings
" Press Ctrl-n to show or hide the nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHIghlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'
let g:NERDTreeWinSize = 18
" End Nerdtree Settings


" airline and vim-one settings
let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'coc', 'branch']
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" tokyonight themes
set termguicolors
let g:tokyonight_style = 'night'    
let g:tokyonight_transparent_background = 0
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 0
colorscheme tokyonight
" End airline and vim-one settings


" easymotion settings
" based on word
map <Leader>w <Plug>(easymotion-bd-w)
" Based on characters 
nmap ss <Plug>(easymotion-s2)
" End easymotion settings


" Tabular settings
nnoremap <Leader>t :Tabularize /
xnoremap <Leader>t :Tabularize /
" End Tabular settings


" vim-surround settings
let g:surround_no_insert_mappings=1
" verb(cs, ds, ys) + scope + object(open parenthesis has one more whitespace)
" some examples:
" "test" --- 'test' --- cs"'
" 'test' --- <q>test</q> --- cs'<q>
" <q>test</q> --- "test" --- cst"
" test --- 'test' --- ysiw'
" test1 test2 --- (test1 test2) --- yss)
" test1 test2 --- { test1 test2 } --- yss{
" End vim-surround settings


" coc.nvim settings
" Use tab to accept selected completion item
" Use <C-n> to select next completion, <C-p> to select previous completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"
inoremap <expr><C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
" Use ' p' and ' n' to navigate diagnostics 
" ' a' to show all diagnostics
nmap <silent> <leader>p <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>n <Plug>(coc-diagnostic-next)
nmap <silent> <leader>a :<C-u>CocList diagnostics<CR>
" Goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use D to show documentation in preview window
nnoremap <silent> D :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
" Symbol renaming
nmap <Leader>rn <Plug>(coc-rename)
" Use <C-a> to trigger completion
inoremap <silent><expr> <C-a> coc#refresh()

" Applying codeAction to the selected region
" Maybe I need some plugs to use these two lines
function! CocActionOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' .visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>CocActionOpenFromSelected<CR>g@
" End coc.nvim settings


" vim-rainbow settings
let g:rainbow_active = 1
" End vim-rainbow settings

" python highlight
let g:python_highlight_all = 1

" check if we can use backspace
function! CheckBackspace() abort
    let col = col('.') - 1            " cursor_pos--
    " if cursor at the beginning of the line or the char before it is whitespace
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

