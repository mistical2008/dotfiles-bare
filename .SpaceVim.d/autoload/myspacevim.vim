function! myspacevim#before() abort

  " Neovide setup
  set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h17
  let g:neovide_cursor_vfx_mode = 'torpedo'
  " set linespace = 20

  " Basic setup
  set splitright " split to the right
  set splitbelow " vsplit to the bottom
  
  set noswapfile "noswap files

  " Vim-zettel:
  let g:zettel_fzf_command = 'rg --column --line-number --ignore-case --no-heading --color=always '

  " zettel.vim
let g:zettelkasten = '~/03_Drafts'

  " Coc: Some servers have issues with backup files
  set nobackup
  set nowritebackup
  set hidden

  let g:vim_markdown_no_default_key_mappings = 1

  let g:user_emmet_settings = {
  \    'variables' : {
  \        'lang' : 'ru',
  \    },
  \    'typescriptreact' : 'javascriptreact',
  \    'typescript' : {
  \       'extends': 'jsx'
  \        }
  \}

  " function! s:parent_section() abort
    " let parent = expand('%:h:t')
    " return parent . '/'
  " endfunction
  " call SpaceVim#layers#core#statusline#register_sections('parent_section', function('s:parent_section'))

  function! GetNodeHostPath() abort
    let l:node_version = trim(system('node -v'))
    return '$HOME/.nvm/versions/node/v14.16.1/lib/node_modules/neovim/bin/cli.js'
    " return '$HOME/.nvm/versions/node/' . l:node_version . '/lib/node_modules/neovim/bin/cli.js'
  endfunction

  function! SetNodeHostPath() abort
    if executable('node')
      let g:node_host_prog = GetNodeHostPath()
    endif
  endfunction

  let g:python3_host_prog = '/usr/bin/python3'
  let g:python_host_prog = '/usr/bin/python2'
  " CAUSES ERROR WITH NODE-NEOVIM
  " autocmd before the end #before function


  " if exists(g:neovide)
    " let g:node_host_prog = '$NVM_BIN/node'
  " endif

  let test#javascript#jest#options = {
  \ 'file':    '--watch',
  \ 'suite':   '--watch',
\}

" Coc settings:
let g:coc_config_home = '~/.SpaceVim.d/'

  " Coc: extensions list:
  let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-stylelintplus',
    \ 'coc-emmet',
    \ 'coc-html',
    \ 'coc-svg',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-git',
    \ 'coc-lists',
    \ 'coc-yank',
    \ 'coc-snippets',
    \ 'coc-explorer',
    \ 'coc-highlight',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-react-refactor',
    \ 'coc-jsref',
    \ 'coc-import-cost',
    \ 'coc-styled-components',
    \ 'coc-cssmodules',
    \ 'coc-sh',
    \ 'coc-webpack',
    \ 'coc-jest',
    \ 'coc-inline-jest',
    \ 'https://github.com/dsznajder/vscode-es7-javascript-react-snippets',
    \ 'coc-marketplace',
    \]

  " Load coc-eslint and coc-prettier only if installed
  if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
  endif
  if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
  endif

  " Coc: delays and poor user experience.
  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  set updatetime=300

  " Coc: Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Set search options:
  set ignorecase

  " Coc: <TAB> behavior"
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " TODO: write function for backup current file
  function! BackupCurrentFile() abort
    let l:current_file = expand('%:t')
    execute(':w $HOME/01_Library/_backups/' . l:current_file)
  endfunction

  " Use <leader>x for convert visual selected code to snippet
  xmap <leader>x  <Plug>(coc-convert-snippet)

  "Do codeaction for selected range
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  "Do codeaction for current line
  nmap <leader>A  <Plug>(coc-codeaction-line)


  " Coc: Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocActionAsync('format')
  " Coc: Use `:Refactor` for refactoring window for current symbos
  command! -nargs=0 Refactor :call CocActionAsync('refactor')
  " Coc: Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)
  " Coc: use `:OR` for organize import of current buffer
  command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

  command! -nargs=0 RenameSym :call CocActionAsync('rename')

  command! -nargs=0 ShowDoc :call CocAction('doHover')

  command! -nargs=0 CodeAction :call CocAction('codeAction')

  " Custom: backup current file to:
  command! -nargs=0 CurFileBackup :call BackupCurrentFile()


  " Coc: mappings
  call SpaceVim#custom#SPCGroupName(['C'], '+Coc-nvim')
  call SpaceVim#custom#SPC('nore', ['C', 'o'], 'CocList outline', 'Buffer symbols outline', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'e'], 'CocList extensions', 'List coc-extensions', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'f'], 'CocCommand explorer', 'Toggle coc-explorer', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'r'], 'Refactor', 'Open coc-refactor window', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'c'], 'CocList commands', 'Open fuzzy coc-commands search', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'y'], 'CocList -A --normal yank', 'Open yank fuzzy search', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'n'], 'RenameSym', 'Rename cword symbol', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'h'], 'ShowDoc', 'Show current symbol help', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'l'], 'CocList', 'Show CocList', 1)
  call SpaceVim#custom#SPC('nore', ['C', 'R'], 'CocCommand workspace.renameCurrentFile', 'Rename current file ,update imports', 1)
  " call SpaceVim#custom#SPC('nore', ['C', 'a'], 'CodeAction', 'Do default actions for language', 1)
  " call SpaceVim#custom#SPC('nmap', ['C', 'A'], '<Plug>(coc-codeaction-selected)', 'Codeaction for selected range', 1)
  " call SpaceVim#custom#SPC('xmap', ['C', 'A'], '<Plug>(coc-codeaction-selected)', 'Codeaction for selected range', 1)
  " call SpaceVim#custom#SPC('nore', ['C', 'a'], '<Plug>(coc-codeaction)', 'Do default actions for language', 1)

  " Projects plugin: mappings"
  call SpaceVim#custom#SPCGroupName(['P'], '+VWProjects')
  call SpaceVim#custom#SPC('nore', ['P', 'p'], 'call MakeProjectPage()', 'Create new project page', 1)
  call SpaceVim#custom#SPC('nore', ['P', 'd'], 'call MakeDBPage()', 'Create new DB page', 1)

  " Backup current file:
  call SpaceVim#custom#SPCGroupName(['@'], 'Backup current file')
  call SpaceVim#custom#SPC('nore', ['@', 'd'], 'call BackupCurrentFile()', 'to the default directory', 1)

  " VimZettel
  call SpaceVim#custom#SPCGroupName(['z'], 'VimZettel')
  call SpaceVim#custom#SPC('nore', ['z', 'o'], 'ZettelOpen', 'FZF search vimwiki notes', 1)
  call SpaceVim#custom#SPC('nore', ['z', 'n'], 'ZettelNew', 'create new zettel note', 1)
  call SpaceVim#custom#SPC('nore', ['z', 'b'], 'VimwikiBacklinks', 'display files that link to the current page', 1)
  call SpaceVim#custom#SPC('nore', ['z', 'c'], 'VimwikiCheckLinks', 'display files that no other file links to', 1)

  " Store undo history in a file for persistent undo
  if has('persistent_undo')
      silent !mkdir ~/.vim/backups > /dev/null 2>&1
      set undodir=~/.vim/backups
      set undofile
  endif


  nmap ]g <Plug>(coc-diagnostic-next)
  nmap [g <Plug>(coc-diagnostic-prev)

  " Set Ale fixer (Eslint)
  let g:ale_disable_lsp = 1
  let g:ale_fixers = {
   \ 'javascript': ['prettier', 'eslint'],
   \ 'typescript': ['prettier', 'eslint'],
   \ 'javascriptreact': ['prettier', 'eslint'],
   \ 'typescriptreact': ['prettier', 'eslint'],
   \ 'python': ['yapf'],
   \ 'css': ['stylelint','prettier'],
   \ 'scss': ['stylelint','prettier'],
   \ 'html': ['prettier']
   \ }
  let b:ale_linters={
        \ 'css': ['stylelint'],
        \ 'html': ['stylelint','htmlhint'],
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint'],
        \ 'python': ['flake8', 'pylint'],
        \ 'ruby': ['standardrb', 'rubocop'],
  \}
  " let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
  " Fix files automatically on save
  "

  " ================================== Vimwiki ===============================
  " Global setup:
  let g:vimwiki_auto_chdir = 1
  let g:vimwiki_folding = 'expr'
  let g:vw_common_ext = '.md'
  let g:vw_common_syntax = 'markdown'
  let g:vw_common_diary_index = '00_main'
  let g:vw_common_auto_tags = 1
  let g:vw_common_nested_syntaxes = 1
  let g:vw_common_auto_diary_index =  1

  " Wikies:
  " Main:
  let wiki_main = {}
  let wiki_main.name = 'Global wiki'
  let wiki_main.path = '~/03_Drafts'
  let wiki_main.path_html = '~/03_Drafts/public_html'
  let wiki_main.index = '000_Home'
  let wiki_main.diary_rel_path = '03_journal/'
  let wiki_main.diary_index = g:vw_common_diary_index
  let wiki_main.syntax = g:vw_common_syntax
  let wiki_main.ext = g:vw_common_ext
  let wiki_main.auto_tags = g:vw_common_auto_tags
  let wiki_main.automatic_nested_syntaxes = g:vw_common_nested_syntaxes
  let wiki_main.auto_diary_index =  g:vw_common_auto_diary_index
  let wiki_main.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'
  " Projects:
  let wiki_proj = {}
  let wiki_proj.name = 'Projects'
  let wiki_proj.path = '~/03_Drafts/02_projects'
  let wiki_proj.path_html = '~/03_Drafts/02_projects/public_html'
  let wiki_proj.index = '../090_Projects_MOC'
  let wiki_proj.diary_rel_path = './../03_journal/'
  let wiki_proj.diary_index = g:vw_common_diary_index
  let wiki_proj.syntax = g:vw_common_syntax
  let wiki_proj.ext = g:vw_common_ext
  let wiki_proj.auto_tags = g:vw_common_auto_tags
  let wiki_proj.automatic_nested_syntaxes = g:vw_common_nested_syntaxes
  let wiki_proj.auto_diary_index =  g:vw_common_auto_diary_index
  let wiki_proj.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'
  " let wiki_proj.nested_syntaxes = {'python': 'python', 'javascript'}
  " DB:
  " let wiki_db = {}
  " let wiki_db.name = "Knowledge base"
  " let wiki_db.path = '~/03_Drafts/04_db'
  " let wiki_db.path_html = '~/03_Drafts/04_db/public_html'
  " let wiki_db.index = '00_main'
  " let wiki_db.diary_rel_path = './../03_journal/'
  " let wiki_db.diary_index = g:vw_common_diary_index
  " let wiki_db.syntax = g:vw_common_syntax
  " let wiki_db.ext = g:vw_common_ext
  " let wiki_db.auto_tags = g:vw_common_auto_tags
  " let wiki_db.automatic_nested_syntaxes = g:vw_common_nested_syntaxes
  " let wiki_db.auto_diary_index =  g:vw_common_auto_diary_index
  " let wiki_db.custom_wiki2html = '$HOME/.vim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'

  let g:vimwiki_list = [wiki_main, wiki_proj]

  " vimwiki with markdown support
  let g:vimwiki_ext2syntax = {'.md': 'markdown',
                            \ '.markdown': 'markdown',
                            \ '.mdown': 'markdown',
                            \ '.wiki': 'media'
                            \ }
  " let g:vimwiki_dir_link = '00_main'
  let g:vimwiki_hl_headers = 1
  let g:vimwiki_hl_cb_checked = 1


  " Vimwiki 8projects variables:
  let g:vwp_todotxt_root = $HOME . '/03_Drafts/01_tasks'

  " Vimwiki Fixes:
  let g:indentLine_fileTypeExclude = ['vimwiki']

  " CtrlP working directory mode
  let g:ctrlp_working_path_mode = 'rc'
  " let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(cfg)$' }

  " Goyo enter mapping:
  nnoremap <Leader>GG :Goyo<CR>

  " Remap ;:
  nnoremap ; :
  nnoremap : ;

  " AUTOCMD's:
  
  augroup Enter_vim
    autocmd!
    if v:vim_did_enter
      call SetNodeHostPath()
    else
      autocmd VimEnter * call SetNodeHostPath()
    endif
  augroup END

  augroup GUI
    autocmd!
    " neovide workaround
    autocmd UIEnter * call setenv('$TERM', 'xterm-256color')
  augroup END

  augroup ft_todo
    autocmd!
    " Use todo#Complete as the omni complete function for todo files
    autocmd filetype todo setlocal omnifunc=todo#Complete
  augroup END

  augroup ft_sxhkd
    autocmd!
    autocmd BufRead,BufNewFile,BufReadPost $HOME/.config/sxhkd/sxhkdrc set filetype=sxhkd
  augroup END

  augroup ft_markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80 spell spelllang=en,ru
  augroup END

  augroup ft_json
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
  augroup END

  augroup ft_typescriptreact
    autocmd!
    autocmd FileType typescriptreact :EmmetInstall
  augroup END

  augroup vim_test
    autocmd!
    autocmd BufWrite * if test#exists() |
      \   TestLast |
      \ endif
  augroup END

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

nnoremap <silent><buffer><expr> <leader>gp ToClipboard(GetProjectsFromTask())
nnoremap <silent><buffer><expr> <leader>gt ToClipboard(GetTagsFromTask())

function! GetTagsFromTask() abort
  return matchstr(getline(line('.')), '\v(\@\a+\s+)+')
endfunction

function! GetProjectsFromTask() abort
  return matchstr(getline(line('.')), '\v(\+\d{3}-\a+\s*)+')
endfunction

function! ToClipboard(arg) abort
  let l:arg_string = string(a:arg)
  execute '!echo ' . l:arg_string . ' | xclip -sel clip'
endfunction

" TODO: rewrite path to main project index in case with my new PKM
function! SetDraftsDir() abort
  if !exists('g:vwp_drafts_path')
    let g:vwp_drafts_path = $HOME . '/03_Drafts/'
  endif
endfunction
call SetDraftsDir()

function! SetDefPojectsDir() abort
  if !exists('g:vwp_projects_path')
    let g:vwp_projects_path = $HOME . '/03_Drafts/02_projects/'
  endif
endfunction
" call SetDefPojectsDir()

function! SetProjectIndexFile() abort
  if !exists('g:vwp_project_index')
    let g:vwp_project_index = '0_project-index'
  endif
endfunction

function! SetProjectsMainIndexFile() abort
  if !exists('g:vwp_project_main_index')
    let g:vwp_project_main_index = '090_Projects_MOC'
  endif
endfunction


function! SetNewProjectsSection() abort
  if !exists('g:vwp_new_project_section')
    let g:vwp_new_project_section = '## Inbox'
  endif
endfunction

" Available syntaxes: wiki, markdown, media
function! SetDefSyntax() abort
  if !exists('g:vwp_syntax')
    let g:vwp_syntax = 'wiki'
  endif
endfunction
let g:vwp_syntax = 'markdown'

function! SetDefTagsHint() abort
  if !exists('g:vwp_tags_hint')
    let g:vwp_tags_hint = $HOME . '/03_Drafts/02_projects/readme.txt'
  endif
endfunction

function! ReadTagsHints() abort
  call SetDefTagsHint()
  let l:readme = readfile(g:vwp_tags_hint)
  return l:readme
endfunction

function! GetProjectDirs() abort
  call SetDefPojectsDir()
  if has('nvim')
    let l:dirs = systemlist("ls -d " . g:vwp_projects_path . "[0-9][0-9][0-9]*/" . "| cut -d'/' -f6")
  else
    let l:dirs = readdir(g:vwp_projects_path)
  endif
  call filter(l:dirs, function('IsProject'))
  return l:dirs
endfunction

function! GetLastProjectDir() abort
  return GetProjectDirs()[-1]
endfunction

function! ConstructNewProjectID() abort
  let l:last_proj_dir = GetLastProjectDir()
  " TODO: rewrite regex for matching id with various length
  " let l:last_proj_id = matchstr(l:last_proj_dir, '^[0-9]\{3}')
  let l:last_proj_id = matchstr(l:last_proj_dir, '\v^[0-9]+\ze_')
  let l:new_id = str2nr(l:last_proj_id) + 1
  return AddLeadingZeroes(l:new_id, len(l:last_proj_id))
endfunction

function! AddLeadingZeroes(string, ...) abort
  let l:string = a:string 
  let l:size = get(a:, 1, 3)
  while len(l:string) < l:size 
    let l:string = "0" . l:string
  endwhile
  return l:string
endfunction

function! GetTodayDate() abort
  return strftime("%Y%m%d",localtime())
endfunction

" Match valid project folder name
function! IsProject(id, dirname)
  " return match(a:dirname, '^[0-9]\{3}_[0-9]\{8}_[a-zA-Z_-]\+$') == 0
  return match(a:dirname, '\v^[0-9]+_[0-9]{8}_[a-zA-Z0-9]+$') == 0
endfunction

" TODO: unify with the SetDBPageName() with an if condition
function! SetProjectDirName() abort
  let l:id = ConstructNewProjectID()
  let l:date = GetTodayDate()
  " let l:tags_hint = ReadTagsHints()

  " echo "######### TAGS HINT #########"
"
  " for line in l:tags_hint
    " echo line
  " endfor

  echo " "
  echo "######### CREATE PROJECT PAGE #########"
  echo "This project will be " . l:id . " by count"
  echo " "
  " let l:tags = input('Enter tags delimited by dashes: ')
  let l:name = input('Enter project name in camelCase: ')
  redraw

  " return l:id.'_'.l:date.'_'.l:tags.'_'.l:name
  return l:id.'_'.l:date.'_'.l:name
endfunction

" function! SetDBPageName(...) " find a more elegant way for optional argument
  " let l:prefix = get(a:, 1, "db")
  " echo "### Create DB page ###"
  " let l:tags = input('Enter tags delimited by dashes: ')
  " let l:name = input('Enter Database name in camelCase: ')
  " redraw
  " return l:prefix.'_'.l:tags.'_'.l:name
" endfunction


function! MakeProjectPage() abort
  call SetDefPojectsDir()
  call SetProjectIndexFile()
  call SetProjectsMainIndexFile()
  call SetNewProjectsSection()
  
  let l:current_file_path = expand('%:p')
  let l:proj_dir_name = SetProjectDirName()
  let l:proj_index_stripped = camelsnek#kebab(l:proj_dir_name)
  let g:vwp_project_index = '0_' . substitute(l:proj_index_stripped, "^\\d\\+-\\d\\+-", "", "")
  let l:proj_main_index_path = g:vwp_drafts_path . g:vwp_project_main_index
  let l:proj_dir_path = g:vwp_projects_path . l:proj_dir_name . '/'
  let l:proj_full_path = l:proj_dir_path . g:vwp_project_index
  let l:proj_lnk = LinkConstructor(l:proj_dir_name)
  if l:current_file_path =~ l:proj_main_index_path
     let l:current_line_content = getline(line('.'))
     call append( nextnonblank( line('.') ), l:proj_lnk )
    " TODO:
    " - (?) check for blank line
    " - If not blank add write with append(line('.'))
    " - Else code below:
  else
    let l:append_command = "sed -i '/" . g:vwp_new_project_section . '/a ' . l:proj_lnk . "' " . l:proj_main_index_path . '.md'
    call system(l:append_command)
  endif
  call mkdir(l:proj_dir_path)
  execute('e ' . l:proj_full_path . '.md')
endfunction

" function! MakeDBPage()
  " let l:current_file_path = expand('%:p')
"
  " Set DB path.
  " let l:db_path = $HOME . '/03_Drafts/04_db/00_main'
  " Set DB prefix. From global var
  " Set DB new pages section
  " SetDBName()
  " let l:db_page_name = SetDBPageName()
  " LinkConstructor()
  " let l:db_link = LinkConstructor(l:db_page_name, 'db')
  " if l:current_file_path =~ l:db_path
    " call append( nextnonblank( line('.') ), l:db_link )
  " else
    " let l:append_command = "sed -i '/" . "## New" . "/a " . l:db_link . "' " . l:db_path . ".md"
    " call system(l:append_command)
  " endif
  " Paste to current line in the DB page
  " OR Paste to default section for a new pages
" endfunction

function! LinkConstructor(proj_dir_name, ...) abort
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
    return "- " . l:dob. input('Enter the project link description: ')  . l:dcb . l:lob . '02_projects/' .  a:proj_dir_name . '/' . g:vwp_project_index . l:lcb
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

" Vim-vista:
let g:vista_sidebar_position = 'vertical topleft'

  let g:spacevim_enable_vimfiler_filetypeicon = 1
  let g:spacevim_enable_vimfiler_gitstatus = 1

  let g:pim#taskfile = '$HOME/tmp/test-todo.txt'

  " END of myspacevim#before
endfunction

function! myspacevim#after() abort

  " Use F to show documentation in preview window
  nnoremap <silent> F :call <SID>ShowDocumentation()<CR>
  
  function! s:ShowDocumentation() abort
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  unmap <F2>
  nnoremap <F2> :Vista!!<CR>

  " Coc: GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> do <Plug>(coc-codeaction)

  " Coc: jump diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  " Map function and class text objects

  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  let g:neosnippet#snippets_directory = ['~/.SpaceVim/bundle/vim-snippets/snippets']

endfunction
