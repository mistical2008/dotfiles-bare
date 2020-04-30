set lazyredraw
scriptencoding utf-8
" set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
" Don't try to be vi compatible
set nocompatible
" set guifont=Source\ Code\ Pro\ 17
set guifont=JetBrains\ Mono\ 10
set vb t_vb= " No horrible visual flash on bell

" Search down into subfolders
set path+=.,,**
" Provides tab-completion for all file-related tasks
set wildmenu
" set autoread                    " Reload files changed outside vim
" au CursorHold * checktime       " check one time after 4s of inactivity in normal mode
set shell=/usr/bin/zsh

set clipboard=unnamedplus       " Use system clipboard as default register

" Helps force plugins to load correctly when it is turned back on below
set fileformat=unix
set fileformats=unix,dos
filetype off
filetype plugin indent on
filetype plugin on

set omnifunc=syntaxcomplete#Complete

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set relativenumber
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()
autocmd CmdlineEnter * call ToggleRelativeOn()
autocmd CmdlineLeave * call ToggleRelativeOn()

" Auto resize Vim splits to active split
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

set mouse=a
set mousehide
set noswapfile "noswap files
set hidden "Allow switching buffers without writing to disk
set cmdheight=2
set signcolumn=yes "Always show the signcolumn,

" Some servers have issues with backup files
set nobackup
set nowritebackup

" :vsplit открывает окна справа
set splitright

" :split открывает окна снизу
set splitbelow

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=1

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

set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set nowrap 		                " Don't visually wrap lines

" Cursor motion
set scrolloff=4
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Turn on syntax highlighting
syntax on

" " Make manual folds persistent:
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview



" ============================== Plug ===================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'nikvdp/ejs-syntax'
Plug 'sorin-ionescu/vim-htmlvalidator', {'for': ['html', 'javascript', 'ejs', 'mason']}
Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'ludovicchabant/vim-gutentags' " Ctags
Plug 'majutsushi/tagbar'  " Build tags based on ctags
Plug 'mtscout6/vim-tagbar-css' " Add css support to tagbar
Plug 'dyng/ctrlsf.vim' " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text
" Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
" Plug 'prettier/vim-prettier', {
  " \ 'do': 'yarn install',
  " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
"Plug 'SirVer/ultisnips'
" Markdown
Plug 'reedes/vim-pencil', {'for': 'markdown'}
" Plug 'nelstrom/vim-markdown-folding'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'w0rp/ale' " Linting
" Plug 'maximbaz/lightline-ale'
" Fuzzy search
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
" Zen writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary' " Toggle comments in various ways.
" Surround text with quotes, parenthesis, brackets, and more.
Plug 'tpope/vim-surround'
" Plug 'francoiscabrol/ranger.vim' " Launch Ranger from Vim.
Plug 'honza/vim-snippets' " vim.snippets
Plug 'sakshamgupta05/vim-todo-highlight' " vim todo and fixme highlighting
Plug 'ryanoasis/vim-devicons' " vim-devicons
" Plug 'Yggdroot/indentLine' " indentline
Plug 'chazy/dirsettings'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
Plug 'djoshea/vim-autoread' " Autoread files changed outside of vim
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/calendar-vim', {'for': 'vimwiki'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lyokha/vim-xkbswitch'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'vifm/vifm.vim'
" Plug 'kkoomen/vim-doge'  " https://vimawesome.com/plugin/doge#table-of-contents
call plug#end()

" Vifm mappings:
nnoremap <leader>vo :Vifm<CR>
nnoremap <leader>vd :DiffVifm<CR>
nnoremap <leader>vt :TabVifm<CR>
nnoremap <leader>vs :SplitVifm<CR>
nnoremap <leader>vv :VsplitVifm<CR>

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
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>

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
let &t_ut='' " Kitty terminal workaround
colorscheme gruvbox
set background=dark
let base16colorspace=256  
" let g:hybrid_termcolors=256
" let g:hybrid_termtrans=1
" Gruvbox has 'hard', 'medium' (default) and 'soft' contrast options.
let g:gruvbox_contrast_light='medium'
set termguicolors
" hi Normal ctermbg=none
set cursorline
" hi CursorLine cterm=underline ctermbg=NONE ctermfg=NONE

" ============================= Airline =======================================
" let g:airline_theme = 'solarized_flood'  " Nord color scheme for the status bar
" let g:airline_inactive_collapse = 1    " Collapse status bar for inactive windows
" let g:airline_powerline_fonts = 1      " Use Powerline font for special symbols
" set noshowmode                         " Disable default status bar
set laststatus=2                       " Always show status bar
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Extensions used:
"   Branch    - Show the current git branch
"   Tabline   - Enable top bar to show tabs and buffers
"   Syntastic - Show errors and warnings from Syntastic on the status bar
"   Tagbar    - Show the current function on the status bar
" let g:airline_extensions = ['branch', 'tabline',]
" Label the tabs/buffers which allows for the tab navigation commands
" let g:airline#extensions#tabline#buffer_idx_mode = 1

" Add support for powerline fonts
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"================================================================================
"                                    Lightline
"================================================================================
" For users who uses lots of plugins:
	let g:lightline = {
	      \ 'colorscheme': 'one',
	      \ 'active': {
	      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ],
        \             [ 'cocstatus', 'currentfunction', 'readonly', 'modified', 'bufnum' ] ,
        \             ['ctrlpmark'] ],
	      \   'right': [ ['lineinfo' ], ['percent'],
        \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
        \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
	      \ },
	      \ 'component_function': {
	      \   'fugitive': 'LightlineFugitive',
	      \   'filename': 'LightlineFilename',
	      \   'fileformat': 'LightlineFileformat',
	      \   'filetype': 'LightlineFiletype',
	      \   'fileencoding': 'LightlineFileencoding',
	      \   'mode': 'LightlineMode',
	      \   'ctrlpmark': 'CtrlPMark',
        \   'cocstatus': 'coc#status',
        \   'currentfunction': 'CocCurrentFunction',
        \  'linter_checking': 'lightline#ale#checking',
        \  'linter_infos': 'lightline#ale#infos',
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
	      \ },
	      \ 'subseparator': { 'left': '|', 'right': '|' }
	      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

	function! LightlineModified()
	  return &ft ==# 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
	endfunction

	function! LightlineReadonly()
	  return &ft !~? 'help' && &readonly ? 'RO' : ''
	endfunction

	function! LightlineFilename()
	  let fname = expand('%:t')
	  return fname ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	        \ fname =~# '^__Tagbar__\|__Gundo\|NERD_tree' ? '' :
	        \ &ft ==# 'vimfiler' ? vimfiler#get_status_string() :
	        \ &ft ==# 'unite' ? unite#get_status_string() :
	        \ &ft ==# 'vimshell' ? vimshell#get_status_string() :
	        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
	        \ (fname !=# '' ? fname : '[No Name]') .
	        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
	endfunction

	function! LightlineFugitive()
	  try
	    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
	      let mark = ''  " edit here for cool mark
	      let branch = FugitiveHead()
	      return branch !=# '' ? mark.branch : ''
	    endif
	  catch
	  endtry
	  return ''
	endfunction

	function! LightlineFileformat()
	  return winwidth(0) > 70 ? &fileformat : ''
	endfunction

	function! LightlineFiletype()
	  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
	endfunction

	function! LightlineFileencoding()
	  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
	endfunction

	function! LightlineMode()
	  let fname = expand('%:t')
	  return fname =~# '^__Tagbar__' ? 'Tagbar' :
	        \ fname ==# 'ControlP' ? 'CtrlP' :
	        \ fname ==# '__Gundo__' ? 'Gundo' :
	        \ fname ==# '__Gundo_Preview__' ? 'Gundo Preview' :
	        \ fname =~# 'NERD_tree' ? 'NERDTree' :
	        \ &ft ==# 'unite' ? 'Unite' :
	        \ &ft ==# 'vimfiler' ? 'VimFiler' :
	        \ &ft ==# 'vimshell' ? 'VimShell' :
	        \ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

	function! CtrlPMark()
	  if expand('%:t') ==# 'ControlP' && has_key(g:lightline, 'ctrlp_item')
	    call lightline#link('iR'[g:lightline.ctrlp_regex])
	    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
	          \ , g:lightline.ctrlp_next], 0)
	  else
	    return ''
	  endif
	endfunction

	let g:ctrlp_status_func = {
	  \ 'main': 'CtrlPStatusFunc_1',
	  \ 'prog': 'CtrlPStatusFunc_2',
	  \ }

	function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	  let g:lightline.ctrlp_regex = a:regex
	  let g:lightline.ctrlp_prev = a:prev
	  let g:lightline.ctrlp_item = a:item
	  let g:lightline.ctrlp_next = a:next
	  return lightline#statusline(0)
	endfunction

	function! CtrlPStatusFunc_2(str)
	  return lightline#statusline(0)
	endfunction

	let g:tagbar_status_func = 'TagbarStatusFunc'

	function! TagbarStatusFunc(current, sort, fname, ...) abort
	  return lightline#statusline(0)
	endfunction

	let g:unite_force_overwrite_statusline = 0
	let g:vimfiler_force_overwrite_statusline = 0
	let g:vimshell_force_overwrite_statusline = 0

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
let g:gtk_nocache = [0x00000000, 0xfc00ffff, 0xf8000001, 0x78000001]

" ============================== Tagbar =======================================
let g:tagbar_compact = 1        " Disable help message
let g:tagbar_singleclick = 1    " Single click to navigate to tag definition
let g:tagbar_sort = 0           " Show tags in the same order as the source
let g:tagbar_width = 30         " Reduce Tagbar split width to 30 columns
let g:tagbar_autoshowtag = 1    " Expand folds to show current tag
let g:tagbar_map_togglefold = "<SPACE>"
let g:tagbar_ctags_bin = '/usr/bin/ctags'


let g:tagbar_type_html = {
\ 'ctagstype' : 'html',
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
    \ ],
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ],
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/usr/bin/markdown2ctags',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

nnoremap <silent> <F8> :TagbarToggle<CR>
" Automatically open Tagbar on C/C++ source files
"autocmd FileType c,cpp,h nested :TagbarOpen

" Vim-xkbswitch:
let g:XkbSwitchEnabled = 1 "Дёргаем рубильник'
"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenwin
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=0

" =================================== Ale =====================================
" Replacing default Ale indicators
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let airline#extensions#ale#error_symbol = ''
let airline#extensions#ale#warning_symbol = ''
" Set Ale fixer (Eslint)
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'css': ['stylelint','prettier'],
 \ 'html': ['fecs']
 \ }
let b:ale_linters={'css': ['stylelint'], 'html': ['stylelint','htmlhint'], 'javascript': ['eslint']}
let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
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
nnoremap <Leader>fr :CtrlPMRUFiles<CR>
nnoremap <Leader>fu :CtrlPUndo<CR>

nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

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
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionSync('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Use `:Refactor` for refactoring window for current symbos
command! -nargs=0 Refactor :call CocActionAsync('refactor')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Open refactor window for symbol under cursor:
nnoremap <silent> <space>r :Refactor<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Open explorer
nnoremap <silent> <space>ex  :<C-u>CocCommand explorer<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Coc-yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" ================================== Vimwiki ===============================
" Main:
let wiki_main = {}
let wiki_main.path = '~/03_Drafts'
let wiki_main.path_html = '~/03_Drafts/public_html'
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
let wiki_proj.path_html = '~/03_Drafts/02_projects/public_html'
let wiki_proj.index = '000_main'
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
let wiki_db.path_html = '~/03_Drafts/04_db/public_html'
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
let g:vimwiki_hl_headers = 1

" let g:vimwiki_folding = 'list'
" let g:vimwiki_customwiki2html='$HOME/.vim/autoload/vimwiki/customwiki2html.sh'
" let g:vimwiki_customwiki2html=$HOME.'/.vim/autoload/vimwiki/wiki2html.sh'
" autocmd FileType vimwiki set ft=markdown
" helppage -> :h vimwiki-syntax 
" Set textwidth for the vimwiki and markdown:
" autocmd BufRead,BufNewFile *.md setlocal textwidth=80
autocmd BufRead,BufNewFile *.md setlocal textwidth=80 spell spelllang=en,ru
autocmd BufRead,BufNewFile *.ejs set syntax=ejs


" Vimwiki projects variables:
let g:vwp_todotxt_root = $HOME . '/03_Drafts/01_tasks'

" Folding
    " za = toggle current fold
    " zR = open all folds
    " zM = close all folds
    " From https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
    function! MyFoldText()
        let line = getline(v:foldstart)
        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart
        " expand tabs into spaces
        let onetab = strpart(' ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')
        let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction

    " set foldtext=MyFoldText()
    " Folds by markers:
    set foldmethod=marker
    " Maximum nesting of folds
    " Only available when compiled with the +folding feature
    set foldnestmax=10
    " All folds are open
    " Only available when compiled with the +folding feature
    set nofoldenable
    " Folds with a higher level will be closed
    " Only available when compiled with the +folding feature
    set foldlevel=1
    " Remove the extrafills --------
    " Only available when compiled with the +windows and +folding features
    set fillchars="fold: "
    " space open/closes folds
    nnoremap <space> za

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0 " disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" ============================= Distraction free viewing ========================
" LimeLight color
" let g:limelight_conceal_ctermfg = 245
" let g:limelight_conceal_guifg = '#eee999'

" LimeLight and Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
nnoremap <Leader>GG :Goyo<CR>

" Limelight mappings
nmap <Leader>ll <Plug>(Limelight)
xmap <Leader>ll <Plug>(Limelight)

" Adopting Ctrl+A selection to vim (Select all)
map <leader>a <esc>ggVG<CR>

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
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :CocCommand explorer
" augroup END

" =============================== Editorconfig ============================
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" ================================= Custom mappings =====================================
" Open URL under cursor:
" nnoremap <leader>w :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>:redraw<CR>
function! Browser()
  let line = getline (".")
  let line = matchstr (line, "\%(http://\|www\.\)[^ ,;\t]*")
  exec "!xdg-open ".line
endfunction
map <Leader>w :call Browser()<CR>

" Source current file. Usefull for testing custom plugins
nnoremap <Leader>sop :source %<CR>

 " ,s
     " Shortcut for :%s//
     nnoremap <leader>s :s/\v/<left>
     nnoremap <leader>ss :%s/\v/<left>
     nnoremap <leader>S :s/\v//gc<left><left><left><left>
     nnoremap <leader>SS :%s/\v//gc<left><left><left><left>
     vnoremap <leader>ss :<C-u>%s/\v//gc<left><left><left><left>

 " Move lnies
     " " Move one line
     " nnoremap <C-S-k> ddkP
     " nnoremap <C-S-j> ddp
     " " Move selected lines
     " " See http://www.vim.org/scripts/script.php?script_id=1590
     " vnoremap <C-S-k> xkP'[V']
     " vnoremap <C-S-j> xp'[V'] " <Esc><Esc>

     " Clear the search highlight in Normal mode
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
" Change dir to the current working file for current window
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Close tab or buffer if no tabs:
nnoremap <leader>C :call CloseTabOrBuffer()<CR>

" Navigate tabs or buffers:
nnoremap <C-PageUp> :call PrevTabOrBuffer()<CR>
nnoremap <C-PageDown> :call NexTabOrBuffer()<CR>

" Test mappings:
" nnoremap <C-+> :echo "Hello C-PgUp key"<CR>

" Toggle netrw explorer:
nnoremap <Leader>ex :Lexplore <CR>

 " Navigate with Ctrl>-hjkl in Insert mode
 inoremap <C-h> <C-o>h
 inoremap <C-j> <C-o>j
 inoremap <C-k> <C-o>k
 inoremap <C-l> <C-o>l

" Remap ;:
nnoremap ; :
nnoremap : ;
" Tabs
" ----
nnoremap <C-t> :tabnew <CR>
nmap tj     :tabnext <CR>
nmap tk     :tabprev <CR>
nmap te     :Texplore <CR>

  noremap <A-1> :tabn1<CR>
  noremap <A-2> :tabn2<CR>
  noremap <A-3> :tabn3<CR>
  noremap <A-4> :tabn4<CR>
  noremap <A-5> :tabn5<CR>
  noremap <A-6> :tabn6<CR>
  noremap <A-7> :tabn7<CR>
  noremap <A-8> :tabn8<CR>
  noremap <A-9> :tabn9<CR>

"Window navigation"
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k

" Edit ~/.vimrc
nnoremap <Leader>ev :tabnew $MYVIMRC <CR>
" Source ~/.vimrc
nnoremap <Leader>sv :so $MYVIMRC <CR>

" Open shrinked bottom terminal
nnoremap <silent> <Leader>bt :ter ++rows=10<CR>
" nnoremap <Leader>bt +10sp +ter<CR>

" Call Synt() for changing syntax
nnoremap <Leader>st :call Synt()<CR>

"VWP:
" Create project page
nnoremap <Leader>pp :call MakeProjectPage()<CR>

" Create DB page
nnoremap <Leader>pd :call MakeDBPage()<CR>

" ============================== AUTOCMDS: ======================================
" JSON syntax highlight comments
autocmd FileType json syntax match Comment +\/\/.\+$+
" augroup SetTodoSyntax
"   au!
"   autocmd BufRead,BufNewFile ~/03_Drafts/01_tasks/*.txt set filetype todo
" augroup END
autocmd BufRead,BufNewFile,BufReadPost $HOME/03_Drafts/01_tasks/*.txt set filetype=todo

" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete
let g:Todo_txt_prefix_creation_date=1

" ============================ Custom commands ==================================
" Close all buffers but this one:
" command AllBufClose :%bd|e
command! BufOnly execute "%bd|e#|bd#"
command! BO execute "%bd|e#|bd#"

" ============================ Custom functions =================================
" Close tab of buffer if no tabs:
function! CloseTabOrBuffer() abort
  let l:tabqty = len(gettabinfo())
  if l:tabqty > 1
    execute "tabclose"
  elseif l:tabqty == 1
    execute "bdel"
  else
    return "Some error occured. Buffer/Tab doesn't closed."
  endif
endfunction

" Navigate tabs or buffers if no tabs:
function! NexTabOrBuffer() abort
  let l:tabqty = len(gettabinfo())
  if l:tabqty > 1
    execute "tabnext"
  elseif l:tabqty == 1
    execute "bnext"
  else
    return "Some error occured. Buffer/Tab doesn't changed."
  endif
endfunction

function! PrevTabOrBuffer() abort
  let l:tabqty = len(gettabinfo())
  if l:tabqty > 1
    execute "tabprev"
  elseif l:tabqty == 1
    execute "bprev"
  else
    return "Some error occured. Buffer/Tab doesn't changed."
  endif
endfunction


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

" Set syntax
command! -nargs=* Synt call Synt()
function! Synt()
  let l:current_syntax = &l:syntax
  let l:new_syntax = input('Enter syntax: ')
  redraw
  if l:new_syntax != ''
    execute 'set syntax='.l:new_syntax
    echom "Previous syntax: '".l:current_syntax."', current: '".&l:syntax."'"
  else
    echo "Syntax doesn't changed"
  endif
endfunction

" 
" Vimwiki: Project link creator
" Set default value for projects directory
" - Construct ID and date for a project filename
"   + Parse ID
"   + Construct New Project ID
"   + Get a today date
"   ! Strip dashes from date # Not needed
"   - Concat ID and date parts with underline symbol and add another one after the date part
" let g:vwp_projects_path = 'path exists'
let g:vwp_id_width = exists('g:vwp_id_width') ? g:vwp_id_width : 3
let g:vwp_todotxt_file = exists('g:vwp_todotxt_file') ? g:vwp_todotxt_file : 'todo.txt'
let g:vwp_todotxt_root = exists('g:vwp_todotxt_root') ? g:vwp_todotxt_root : $HOME . '/todo'
let g:vwp_todotxt_path = g:vwp_todotxt_root . '/' . g:vwp_todotxt_file

function! SetDefPojectsDir()
  if !exists('g:vwp_projects_path')
    let g:vwp_projects_path = $HOME . '/03_Drafts/02_projects/'
  endif
endfunction
" call SetDefPojectsDir()

function! SetProjectIndexFile()
  if !exists('g:vwp_project_index')
    let g:vwp_project_index = '0_main'
  endif
endfunction

function! SetProjectsMainIndexFile()
  if !exists('g:vwp_project_main_index')
    let g:vwp_project_main_index = '000_main'
  endif
endfunction


function! SetNewProjectsSection()
  if !exists('g:vwp_new_project_section')
    let g:vwp_new_project_section = '## Inbox'
  endif
endfunction

" Available syntaxes: wiki, markdown, media
function! SetDefSyntax()
  if !exists('g:vwp_syntax')
    let g:vwp_syntax = 'wiki'
  endif
endfunction
let g:vwp_syntax = 'markdown'

function! GetProjectDirs()
  call SetDefPojectsDir()
  let l:dirs = readdir(g:vwp_projects_path)
  call filter(l:dirs, function('IsProject'))
  return l:dirs
endfunction

function! GetLastProjectDir()
  return GetProjectDirs()[-1]
endfunction

function! ConstructNewProjectID()
  let l:last_proj_dir = GetLastProjectDir()
  " TODO: rewrite regex for matching id with various length
  " let l:last_proj_id = matchstr(l:last_proj_dir, '^[0-9]\{3}')
  let l:last_proj_id = matchstr(l:last_proj_dir, '\v^[0-9]+\ze_')
  echo l:last_proj_id
  let l:new_id = str2nr(l:last_proj_id) + 1
  echo l:new_id
  return AddLeadingZeroes(l:new_id, len(l:last_proj_id))
endfunction

function! AddLeadingZeroes(string, ...) 
  let l:string = a:string 
  let l:size = get(a:, 1, 3)
  while len(l:string) < l:size 
    let l:string = "0" . l:string
  endwhile
  return l:string
endfunction

function! GetTodayDate()
  return strftime("%Y%m%d",localtime())
endfunction

" Match valid project folder name
function! IsProject(id, dirname)
  " return match(a:dirname, '^[0-9]\{3}_[0-9]\{8}_[a-zA-Z_-]\+$') == 0
  return match(a:dirname, '\v^[0-9]+_[0-9]{8}_[a-zA-Z_-]+$') == 0
endfunction

" TODO: unify with the SetDBPageName() with an if condition
function! SetProjectDirName()
  let l:id = ConstructNewProjectID()
  let l:date = GetTodayDate()
  let l:tags = input('Enter tags delimited by dashes: ')
  let l:name = input('Enter project name in camelCase: ')
  redraw
  return l:id.'_'.l:date.'_'.l:tags.'_'.l:name
endfunction

function! SetDBPageName(...) " find a more elegant way for optional argument
  let l:prefix = get(a:, 1, "db")
  let l:tags = input('Enter tags delimited by dashes: ')
  let l:name = input('Enter Database name in camelCase: ')
  redraw
  return l:prefix.'_'.l:tags.'_'.l:name
endfunction


function! MakeProjectPage()
  call SetDefPojectsDir()
  call SetProjectIndexFile()
  call SetProjectsMainIndexFile()
  call SetNewProjectsSection()
  
  let l:current_file_path = expand('%:p')
  let l:proj_dir_name = SetProjectDirName()
  let l:proj_main_index_path = g:vwp_projects_path . g:vwp_project_main_index
  let l:proj_dir_path = g:vwp_projects_path . l:proj_dir_name . '/'
  let l:proj_full_path = l:proj_dir_path . g:vwp_project_index
  let l:proj_lnk = LinkConstructor(l:proj_dir_name)
  if l:current_file_path =~ l:proj_main_index_path
     let l:current_line_content = getline(line('.'))
     " if match(l:current_line, '^[\s\t]*$') == 0
     "  call setline( line('.'), getline(line('.')) . l:proj_lnk )
     " else
     "  call append( line('.'), l:proj_lnk ) 
     " endif
     " One line append/insert:
     call append( nextnonblank( line('.') ), l:proj_lnk )
    " TODO:
    " - (?) check for blank line
    " - If not blank add write with append(line('.'))
    " - Else code below:
  else
    let l:append_command = "sed -i '/" . g:vwp_new_project_section . "/a " . l:proj_lnk . "' " . l:proj_main_index_path . ".md"
    call system(l:append_command)
  endif
  call mkdir(l:proj_dir_path)
  execute('e ' . l:proj_full_path . '.md')
endfunction

function! MakeDBPage()
  let l:current_file_path = expand('%:p')

  " Set DB path. 
  let l:db_path = $HOME . '/03_Drafts/04_db/00_main'
  " Set DB prefix. From global var
  " Set DB new pages section
  " SetDBName()
  let l:db_page_name = SetDBPageName()
  " LinkConstructor()
  let l:db_link = LinkConstructor(l:db_page_name, 'db')
  if l:current_file_path =~ l:db_path
    call append( nextnonblank( line('.') ), l:db_link )
  else
    let l:append_command = "sed -i '/" . "## New" . "/a " . l:db_link . "' " . l:db_path . ".md"
    call system(l:append_command)
  endif
  " Paste to current line in the DB page
  " OR Paste to default section for a new pages
endfunction

function! LinkConstructor(proj_dir_name, ...)
  let l:type = get(a:,1,"proj") " TODO: come up with a more elegant approach
  let l:dob = g:vwp_list.markdown.descr[0]
  let l:dcb = g:vwp_list.markdown.descr[1]
  let l:lob = g:vwp_list.markdown.link[0]
  let l:lcb = g:vwp_list.markdown.link[1]
  if l:type ==# "db"
    return "- " . l:dob. input('Enter the Database link description: ') . l:dcb . l:lob . a:proj_dir_name . l:lcb
    redraw
  else
    call SetProjectIndexFile()
    return "- " . l:dob. input('Enter the project link description: ')  . l:dcb . l:lob .  a:proj_dir_name . "/" . g:vwp_project_index . l:lcb
    redraw
  endif
endfunction

" TODO: Functions to make (MakeDone, MakeNext, MakePaused, Make abandoned)
" 

" TODO: 
" - add vimwiki links syntax.
" - rewrite g:vwp_list. Include all default settings values.
let g:vwp_list = {
      \'markdown' : {
      \'descr' : ['[', ']'],
      \'link'  : ['(', ')']
      \},
\}
         
" Projects and Tasks integration: 
function! s:ReadTodoTxt(path) abort
  return readfile(a:path)
endfunction

function! ReadProjTodos(path) abort
  " TODO: implement the filter() function
  let l:file_content = readfile(a:path) " =~ '\m^\s*-\[\s\]\s+\zs[.*]+'
  echo l:file_content
  let l:start_ind = matchstrpos(l:file_content, '\v^#*\s[Tt]asks')[1] + 1
  " return filter(l:file_content, "v:val =~ '^ *- '")
  " return filter(l:file_content, "v:val =~ '^#\\{1,6}\\s[Tt]asks'")
  return l:file_content[l:start_ind:]
endfunction

" Coc-nvim extensions list:
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ 'coc-svg',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-git',
  \ 'coc-lists',
  \ 'coc-pairs',
  \ 'coc-yank',
  \ 'coc-snippets',
  \ 'coc-browser',
  \ 'coc-diagnostic',
  \ 'coc-highlight',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-stylelint',
  \]

" vim-ledger settings:
" let g:ledger_detailed_first = 1
" au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

" Fixes alacrity mouse issues:
set ttymouse=sgr

" let reg_save = @@

" let @@ = "Hello!"

" exec "normal! p"

" let @@ = reg_save


" Safely change work dir to current file pwd:
" let s:default_path = escape(&path, '\ ') " store default value of 'path'

" " Always add the current file's directory to the path and tags list if not
" " already there. Add it to the beginning to speed up searches.
" autocmd BufRead *
"       \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
"       \ exec "set path-=".s:tempPath |
"       \ exec "set path-=".s:default_path |
"       \ exec "set path^=".s:tempPath |
"       \ exec "set path^=".s:default_path
"
" CtrlSF set default root for searches:
let g:ctrlsf_default_root = 'project+fw'
" Set regex by default:
let g:ctrlsf_regex_pattern = 1

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" =======================================
" Custom vim functions:
" ======================================
" Comment Block:
" TODO: Rewrite with dict as arguments storage
function CommentBlock(comment, ...)
  let introducer = a:0 >= 1 ? a:1 : "//"
  let box_char = a:0 >= 2 ? a:2 : "*"
  let width = a:0 >= 3 ? a:3 : strlen(a:comment) + 10
  let indent = ( width / 2 ) - ( strlen(a:comment) / 2)

  " Build the comment box and put the comment inside it...
  return introducer . repeat(box_char, width) . "\<CR>"
  \ .    introducer . repeat(" ", indent) . a:comment         . "\<CR>"
  \ .    introducer . repeat(box_char, width) . "\<CR>"
endfunction

imap <silent> /// <C-R>=CommentBlock(input("Enter comment: "), "//", "=", 80)<CR>
imap <silent> ### <C-R>=CommentBlock(input("Enter comment: "), "#", "=", 80)<CR>
imap <silent> """ <C-R>=CommentBlock(input("Enter comment: "), "\"", "=", 80)<CR>

" Highlight column more then 80 cols:
highlight ColorColumn ctermbg=235
call matchadd('ColorColumn', '\%81v', 100)
" set colorcolumn=81

" Blink cursor on next search result:
function HLNext(blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let blinks = 1
  for n in range(1, blinks)
    let l:hlt = matchadd('DiffChange', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2 * blinks) * 1000) . 'm'
    call matchdelete(l:hlt)
    redraw
    exec 'sleep ' . float2nr(a:blinktime / (2 * blinks) * 1000) . 'm'
  endfor
endfunction

nnoremap <silent> n n:call HLNext(0.4)<CR>
nnoremap <silent> N N:call HLNext(0.4)<CR>
" vim:foldmethod=marker:foldlevel=0
