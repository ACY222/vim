""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" base config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible 	" not vi compatible
set shortmess+=sI 	" Disable the default Vim startup message
set noerrorbells visualbell t_vb=   " Disable audible bell

filetype on         " enable file type detection,
filetype indent on	" use corresponding indent
filetype plugin on	" set load plugin by file type
syntax enable		" highlight enable
syntax on  			" highlight auto
set t_Co=256        " use 256 colors

set cursorline		" highlight current line

set number   		" enable line number
set relativenumber 	" relative line number

" status line
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
let maplocalleader=","
" having longer updatetime brings noticable delays and poor user experience
set updatetime=100  
" Always show the signcolumn(the margin in the left), otherwise it would shift 
" the text each time diagnostics appear/become resolved(coc)
set signcolumn=yes
set showmatch
set matchtime=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd 		" display inputting commands
set autoindent 		" copy indent from current line when starting a new line 

" show indent line, it looks annoying
" set list
" set listchars=tab:\ \ ,leadmultispace:▸···,multispace:\ \ 

set tabstop=4       " the size of tab
set expandtab		" replace tab with spaces
set softtabstop=4	" 1 tab == 4 spaces
set shiftwidth=4	" shift size when using '<<' or '>>'
set shiftround      " round indent to multiple of 4

set textwidth=80    " the width of each line
set wrap            " break lines automatically
set linebreak       " break only when encountering with specific character
set scrolloff=5
" match ErrorMsg '\%>80v.\+'	" highlight the characters above 80

set undofile                " create undo file
set undodir=~/.vim/.undo//
set history=50              " record 100 operations

set timeoutlen=500  " so the <esc>O won't delay for long

" When editing a new file, save it automatically.
" 1. The event to watch for
" 2. A pattern to filter the event. For example: *.txt
" 3. The command to run
" Do it in this way to avoid adding dupicate autocmds every time we source vimrc
augroup writeNewFile
    autocmd!
    autocmd BufNewFile * :w
augroup END

" Vimscript file settings, now we can fold vim codes using 'za'{{{
augroup fold_vimscript
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

set foldlevelstart=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==# is the 'case-sensitive no matter what the user has set'
" ==? is the 'case-insensitive no matter what the user has set'
set ignorecase 		" Now, 'foo' == 'FOO' is true!. But ==# still works
set smartcase 	    " ignore case when lowercase letter only 
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
" Use jk to escape insert mode, disable <esc> to force myself to use new keys
inoremap jk <esc>
inoremap <esc> <nop>
" Unbind some useless/annoying default key bindings.
nnoremap Q <nop>
" Use some key mappings to compile and run quickly
autocmd FileType cpp nnoremap <C-i> :!g++ -std=c++20 % -o %<<CR>:!./%<<CR>
autocmd FileType c nnoremap <C-i> :!gcc % -o %<<CR>:!./%<<CR>
autocmd FileType python nnoremap <C-i> :!python3 %<CR>

" Have j and k navigate visual lines rather than logical lines
" Sometimes it will cause relative numbers inaccurate
nnoremap j gj
nnoremap k gk
" Now I'm using them to shift between windows
" nnoremap H 0
" nnoremap L $

" Some snippets
" fix the misspelling automatically
iabbrev inlcude include
" abbrev for my name and stu_number, they save quite little time
" iabbrev myname Ai Chang
" iabbrev mynum PB22111620
" iabbrev rt return
" iabbrev return NOPENOPENOPE

" Convert the current word to uppercase in insert mode
" Extremely useful when I'm writing out the name of a long constant like
" MAX_CONNECTIONS_ALLOWED, I can type out it in lower case and then
" uppercase it with the mapping instead of holding shift the entire time
inoremap <C-u> <esc>viwUea
" Convert the current word to uppercase in normal mode
nnoremap <S-u> viwU

" change window size
nnoremap <C-k> <C-w>+
nnoremap <C-j> <C-w>-
nnoremap <C-h> <C-w>>
nnoremap <C-l> <C-w><

" shift between windows
nnoremap <S-k> <C-w>k
nnoremap <S-j> <C-w>j
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l

" shift between buffers without using colons 
" 'bn', 'bp' will make b very slow
" 'nb', 'pb' will make n, p very slow
" '<leader>p' will make <leader>py very slow, but recently I won't use python
" very often, and python instructions are very short, so it will be nice
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>b :bd 

nnoremap <leader>for :e /mnt/d/Desktop/for_study/2025_1Spring/CS106L/notes/

" save what you yank, even after you delete, actually, I often forget to use it
nnoremap <leader><leader>p "0p  

" edit .vimrc when editing other files
nnoremap <leader>vim :e $MYVIMRC<CR>
nnoremap <leader>rc :vsp $MYVIMRC<CR>
" source my .vimrc
nnoremap <leader>sv :w <CR> :source $MYVIMRC<CR>
" install and clean plugins
nnoremap <leader>in :PlugInstall<CR>
nnoremap <leader>cl :PlugClean<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins list
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
call plug#end()


" LeaderF settings
let g:Lf_ShortcutF = '<C-p>'
" End LeaderF settings


" tagbar settings
" Press F8 to see the construction of the file
noremap <F8> :TagbarToggle<CR>
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


" " Clear status line when vimrc is reload
" set statusline=
" " %F: full path of current file, $Y: type of file in the buffer
" set statusline+=\ %F\ %Y        " status line in the left side
" set statusline+=%=  " Use a divider to separate the two sides
" " %l: row number, %c: column number, %p%%: cursor percentage from the top
" set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%
" airline settings
let g:airline_theme = 'tokyonight'
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'coc', 'branch']
" I'm not sure what's enhanced tabline for
" let g:airline#extensions#tabline#enabled = 1

" airline statusline by default
" |A|B|     C       X|Y|Z|[...]
let g:airline_section_b = '%n'              " buffer number
let g:airline_section_c = '%f'              " file name
let g:airline_section_x = '%h'              " help buffer flag
let g:airline_section_y = '%y'              " filetype
let g:airline_section_z = '%p%% ≡ %l/%L %c' " percentage, row, Row, column
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
nnoremap <leader>w <Plug>(easymotion-bd-w)
" Based on characters 
nnoremap <leader>s <Plug>(easymotion-s2)
" End easymotion settings


" Tabular settings
nnoremap <leader>t :Tabularize /
xnoremap <leader>t :Tabularize /
" End Tabular settings


" vim-surround settings
" it seems that I can do these with key-mapping
let g:surround_no_insert_mappings=1
" verb(cs, ds, ys) + scope + object(open parenthesis has one more whitespace)
" some examples:
" "test"      --- 'test'          --- cs"'
" 'test'      --- <q>test</q>     --- cs'<q>
" <q>test</q> --- "test"          --- cst"
" test        --- 'test'          --- ysiw'
" test1 test2 --- (test1 test2)   --- yss)
" test1 test2 --- { test1 test2 } --- yss{
" End vim-surround settings

" coc.nvim settings
" Use tab to accept selected completion item
" Use <C-n> to select next completion, <C-p> to select previous completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"
inoremap <expr><C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <expr><C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
" Use ' -' and ' =' to navigate diagnostics 
" ' a' to show all diagnostics
nnoremap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nnoremap <silent> <leader>= <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>a :<C-u>CocList diagnostics<CR>
" Goto code navigation
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gt <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
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
nnoremap <leader>rn <Plug>(coc-rename)
" Use <C-a> to trigger completion
inoremap <silent><expr> <C-a> coc#refresh()
" Applying codeAction to the selected region
" Maybe I need some plugins to use these two lines
function! CocActionOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction
xnoremap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' .visualmode()<CR>
nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>CocActionOpenFromSelected<CR>g@
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

