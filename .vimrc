scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" Don't try to be vi compatible
set nocompatible
" set guifont=Source\ Code\ Pro\ 17
set guifont=Source\ Code\ Pro\ Light:h17
set vb t_vb= " No horrible visual flash on bell

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu
" set autoread                    " Reload files changed outside vim
" au CursorHold * checktime       " check one time after 4s of inactivity in normal mode

set clipboard=unnamedplus       " Use system clipboard as default register
set nowrap 		                " Don't visually wrap lines

" Helps force plugins to load correctly when it is turned back on below
filetype on
filetype plugin indent on
filetype plugin on

set omnifunc=syntaxcomplete#Complete
set relativenumber
set mouse=a
set noswapfile "noswap files
set hidden "Allow switching buffers without writing to disk
set cmdheight=2

" :vsplit открывает окна справа
set splitright

" :split открывает окна снизу
set splitbelow

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Rendering
set ttyfast

" Last line
set showmode
set showcmd

" Whitespace
set wrap
set textwidth=89
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=4
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Turn on syntax highlighting
syntax on

" ============================== Plug ===================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ludovicchabant/vim-gutentags' " Ctags
Plug 'majutsushi/tagbar'  " Build tags based on ctags
Plug 'mtscout6/vim-tagbar-css' " Add css support to tagbar
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'ap/vim-css-color'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'SirVer/ultisnips'
" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown'
Plug 'w0rp/ale' " Linting
" Fuzzy search
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
" Zen writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary' " Toggle comments in various ways.
" Surround text with quotes, parenthesis, brackets, and more.
Plug 'tpope/vim-surround'
Plug 'francoiscabrol/ranger.vim' " Launch Ranger from Vim.
Plug 'honza/vim-snippets' " vim.snippets
Plug 'sakshamgupta05/vim-todo-highlight' " vim todo and fixme highlighting
Plug 'ryanoasis/vim-devicons' " vim-devicons
Plug 'Yggdroot/indentLine' " indentline
Plug 'chazy/dirsettings'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plug 'djoshea/vim-autoread' " Autoread files changed outside of vim
call plug#end()


" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:hybrid_termcolors=256
let g:hybrid_termtrans=1
colorscheme gruvbox
" Gruvbox has 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='medium'
hi Normal ctermbg=none
set cursorline
" hi CursorLine cterm=underline ctermbg=NONE ctermfg=NONE

" ============================= Airline =======================================
let g:airline_theme = 'base16_chalk'  " Nord color scheme for the status bar
let g:airline_inactive_collapse = 1    " Collapse status bar for inactive windows
let g:airline_powerline_fonts = 1      " Use Powerline font for special symbols
set noshowmode                         " Disable default status bar
set laststatus=2                       " Always show status bar
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Extensions used:
"   Branch    - Show the current git branch
"   Tabline   - Enable top bar to show tabs and buffers
"   Syntastic - Show errors and warnings from Syntastic on the status bar
"   Tagbar    - Show the current function on the status bar
let g:airline_extensions = ['branch', 'tabline', 'ycm', 'tagbar', ]
" Label the tabs/buffers which allows for the tab navigation commands
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Add support for powerline fonts
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" vim-javascript gliphs
" https://github.com/pangloss/vim-javascript
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "⭘"
"let g:javascript_conceal_underscore_arrow_function = "⭘"

" ============================== Tagbar =======================================
let g:tagbar_compact = 1        " Disable help message
let g:tagbar_singleclick = 1    " Single click to navigate to tag definition
let g:tagbar_sort = 0           " Show tags in the same order as the source
let g:tagbar_width = 30         " Reduce Tagbar split width to 30 columns
let g:tagbar_autoshowtag = 1    " Expand folds to show current tag
let g:tagbar_map_togglefold = "<SPACE>"

let g:tagbar_type_html = {
    \ 'kinds' : [
        \ 'C:stylesheets',
        \ 'a:named anchors',
        \ 'h:H1 headings',
        \ 'i:H2 headings',
        \ 'j:H3 headings',
        \ 'I:Identifiers',
        \ 'c:classes',
        \ 'J:scripts'
    \ ],
\ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'i:identities',
        \ 'm:medias',
        \ 's:selectors'
    \ ]
\ }
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/usr/bin/markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
nmap <F8> :TagbarToggle<CR>
" Automatically open Tagbar on C/C++ source files
"autocmd FileType c,cpp,h nested :TagbarOpen

" =================================== Ale =====================================
" Replacing default Ale indicators
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let airline#extensions#ale#error_symbol = ''
let airline#extensions#ale#warning_symbol = ''
" Set Ale fixer (Eslint)
let b:ale_fixers = {
 \ 'javascript': ['prettier'],
 \ 'css': ['prettier']
 \ }
let b:ale_linters={'css': ['stylelint'], 'html': ['prettier','stylelint']}
" Fix files automatically on save
let g:ale_fix_on_save = 1
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)


" ================================ FZF ==================================
nnoremap <C-p> :Files<CR>
nnoremap <Leader>fg :GitFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fm :Maps<CR>

nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" Store undo history in a file for persistent undo
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

"Load help tags
packloadall
silent! helptags ALL

" ================================ Coc-snippets ===========================
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ================================== Vimwiki ===============================
" Main:
let wiki_main = {}
let wiki_main.path = '~/03_Drafts'
let wiki_main.path_html = '~/03_Drafts/html'
let wiki_main.index = '00_main'
let wiki_main.diary_rel_path = '03_journal/'
let wiki_main.diary_index = '00_main'
let wiki_main.syntax = 'markdown'
let wiki_main.ext = '.md'
let wiki_main.auto_tags = 1
let wiki_main.automatic_nested_syntaxes = 1
let wiki_main.auto_diary_index =  1
let wiki_main.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'
" Projects:
let wiki_proj = {}
let wiki_proj.path = '~/03_Drafts/02_projects'
let wiki_proj.path_html = '~/03_Drafts/02_projects/html'
let wiki_proj.index = '00_main'
let wiki_proj.diary_rel_path = './../03_journal/'
let wiki_proj.diary_index = '00_main'
let wiki_proj.syntax = 'markdown'
let wiki_proj.ext = '.md'
let wiki_proj.auto_tags = 1
let wiki_proj.automatic_nested_syntaxes = 1
let wiki_proj.auto_diary_index =  1
let wiki_proj.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'
" let wiki_proj.nested_syntaxes = {'python': 'python', 'javascript'}
" DB:
let wiki_db = {}
let wiki_db.path = '~/03_Drafts/04_db'
let wiki_db.path_html = '~/03_Drafts/04_db/html'
let wiki_db.index = '00_main'
let wiki_db.diary_rel_path = './../03_journal/'
let wiki_db.diary_index = '00_main'
let wiki_db.syntax = 'markdown'
let wiki_db.ext = '.md'
let wiki_db.auto_tags = 1
let wiki_db.automatic_nested_syntaxes = 1
let wiki_db.auto_diary_index =  1
let wiki_db.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'

let g:vimwiki_list = [wiki_main, wiki_proj, wiki_db]

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                          \ '.markdown': 'markdown',
                          \ '.mdown': 'markdown',
                          \ '.wiki': 'media'
                          \ }
let g:vimwiki_dir_link = '00_main'
" let g:vimwiki_customwiki2html='$HOME/.vim/autoload/vimwiki/customwiki2html.sh'
" let g:vimwiki_customwiki2html=$HOME.'/.vim/autoload/vimwiki/wiki2html.sh'
" autocmd FileType vimwiki set ft=markdown
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0 " disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" ============================= Distraction free viewing ========================
" LimeLight color
let g:limelight_conceal_ctermfg = 245
let g:limelight_conceal_guifg = '#eee999'

" LimeLight and Goyo.vim integration
autocmd! User GoyoEnter Limelight
" autocmd User GoyoLeave GoyoAfter()
" function! GoyoAfter()
"   Limelight!
"   set background = dark
"   colorscheme gruvbox
" endfunction
autocmd User GoyoLeave Limelight!
" autocmd! User GoyoLeave Limelight! | source $MYVIMRC
" autocmd! User GoyoLeave source $MYVIMRC | Limelight!

" Limelight mappings
nmap <Leader>ll <Plug>(Limelight)
xmap <Leader>ll <Plug>(Limelight)

" Adopting Ctrl+A selection to vim (Select all)
map <C-a> <esc>ggVG<CR>

" Indentline settings
let g:indentLine_char = '┆'

" ======================= Netrw settings like NERDtree ==========================
let g:netrw_banner = 0       " disable annoying banner
let g:netrw_browse_split = 4 " open in prior window
let g:netrw_altv = 1         " open splits to the right
let g:netrw_liststyle = 3    " tree view
let g:netrw_winsize = 25     " windowsize
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide .= ',\(^\|\s\s\)\zs\.\S\+'
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END


" ================================= Custom mappings =====================================
" Change dir to the current working file for current window
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" Tabs
" ----
nmap <C-t>  :tabnew <CR>
nmap tj     :tabnext <CR>
nmap tk     :tabprev <CR>
nmap te     :Texplore <CR>

" if has('gui_macvim')
"   nmap <D-1>	:tabn1 <CR>
"   nmap <D-2>	:tabn2 <CR>
"   nmap <D-3>	:tabn3 <CR>
"   nmap <D-4>	:tabn4 <CR>
"   nmap <D-5>	:tabn5 <CR>
"   nmap <D-6>	:tabn6 <CR>
"   nmap <D-7>	:tabn7 <CR>
"   nmap <D-8>	:tabn8 <CR>
"   nmap <D-9>	:tabn9 <CR>
" else
  noremap <C-1> :tabn1<CR>
  noremap <C-2> :tabn2<CR>
  noremap <C-3> :tabn3<CR>
  noremap <C-4> :tabn4<CR>
  noremap <C-5> :tabn5<CR>
  noremap <C-6> :tabn6<CR>
  noremap <C-7> :tabn7<CR>
  noremap <C-8> :tabn8<CR>
  noremap <C-9> :tabn9<CR>
" endif

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble single lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"Window navigation"
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" AUTOCMDS:
" JSON syntax highlight comments
autocmd FileType json syntax match Comment +\/\/.\+$+
" augroup SetTodoSyntax
"   au!
"   autocmd BufRead,BufNewFile ~/03_Drafts/01_tasks/*.txt set filetype todo
" augroup END
autocmd BufRead,BufNewFile,BufReadPost ~/03_Drafts/01_tasks/*.txt set syntax=todo

" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete
let g:Todo_txt_prefix_creation_date=1

" ============================ Custom commands ==================================
" Close all buffers but this one:
" command AllBufClose :%bd|e
command! BufOnly execute "%bd|e#|bd#"
command! BO execute "%bd|e#|bd#"

" ============================ Custom functions =================================
" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
nmap <C-S-Tab> :call SummarizeTabs() <CR>
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
