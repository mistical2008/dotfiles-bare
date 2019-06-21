
" Don't try to be vi compatible
set nocompatible
set guifont=Source\ Code\ Pro\ 15
" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'skammer/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'SirVer/ultisnips'
" Markdown
Plug 'reedes/vim-pencil'
Plug 'nelstrom/vim-markdown-folding'
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown'
" Linting
Plug 'w0rp/ale'
" Fuzzy search
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
" Ctags
Plug 'ludovicchabant/vim-gutentags'
" Zen writing
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Toggle comments in various ways.
Plug 'tpope/vim-commentary'
" Surround text with quotes, parenthesis, brackets, and more.
Plug 'tpope/vim-surround'
" Launch Ranger from Vim.
Plug 'francoiscabrol/ranger.vim'
" vim.snippets
Plug 'honza/vim-snippets'
call plug#end()
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set mouse=a

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

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

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
let g:gruvbox_contrast_light='hard'
hi Normal ctermbg=none

" Add support for powerline fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
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
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "⭘"
let g:javascript_conceal_underscore_arrow_function = "⭘"

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

nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)

"Load help tags
packloadall
silent! helptags ALL
" Coc-snippets
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

" Set vimwiki syntax to markdown
let g:vimwiki_list = [{'path': '~/03_Drafts',
 \ 'syntax': 'markdown', 'ext': '.md'}]
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown',
                          \ '.markdown': 'markdown',
                          \ '.mdown': 'markdown',
                          \ '.wiki': 'media'
                          \ }
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0 " disable autostart
map <leader>md :InstantMarkdownPreview<CR>

" LimeLight color
let g:limelight_conceal_ctermfg=244

" LimeLight and Goyo.vim integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Limelight mappings
nmap <Leader>ll <Plug>(Limelight)
xmap <Leader>ll <Plug>(Limelight)
