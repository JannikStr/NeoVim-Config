" Plugins{{{1

set nocompatible

set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim
if dein#load_state(expand('~/.config/dein'))
    call dein#begin(expand('~/.config/dein'), expand('~/.vimrc'))
" Code display{{{4
    call dein#add('rakr/vim-one')
    call dein#add('sonph/onehalf', {
                \ 'rtp': 'vim'
                \ })
    call dein#add('morhetz/gruvbox')
    
    call dein#add('ntpeters/vim-better-whitespace')

    call dein#add('preservim/nerdcommenter')
    call dein#add('preservim/tagbar')

    call dein#add('nathanaelkane/vim-indent-guides')

    " Commands{{{2
    call dein#add('Shougo/dein.vim')
    call dein#add('haya14busa/dein-command.vim')
    " Completion{{{2
    call dein#add('neoclide/coc.nvim', {
                \ 'rev': 'release',
                \ })
    " Integrations{{{2
    call dein#add('dense-analysis/ale')
    call dein#add('tpope/vim-fugitive')
    call dein#add('idanarye/vim-merginal')
    call dein#add('kdheepak/lazygit.nvim')
    call dein#add('ilyachur/cmake4vim')
    call dein#add('rust-lang/rust.vim')

    " Interface{{{2
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('airblade/vim-gitgutter')

    " Utility{{{2
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-surround')
    call dein#add('unblevable/quick-scope')

    " Language{{{2
    call dein#add('python-mode/python-mode', {
                \ 'rev': 'develop',
                \ 'on_ft': ['python']
                \ })

    call dein#add('raimon49/requirements.txt.vim')
    call dein#add('fatih/vim-go')

    " Filesystem{{{2
    call dein#add('junegunn/fzf', { 'build': './install', 'merged': 0})
    call dein#add('junegunn/fzf.vim')

    call dein#add('sharkdp/fd')
    call dein#add('nvim-treesitter/nvim-treesitter')
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.x'})

    call dein#add('preservim/nerdtree')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    
    " Debug{{{2
    call dein#add('puremourning/vimspector')

    call dein#end()
    call dein#save_state()
endif

" Global Variables{{{1
let g:default_linelength = get(g:, 'default_linelength', 120)
" Plugin options{{{1
" Code display{{{2
" vim-one options{{{3
let g:one_allow_italics = 1
" better-whitespace options{{{3
highlight ExtraWhitespace ctermbg=blue
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=0
let g:strip_only_modified_lines=1
let g:strip_whitespace_confirm=0

" tagbar options{{{3
let g:tagbar_ctags_bin='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'

" Commands{{{2
" dein.vim options{{{3
let g:dein#auto_recache = 1
let g:dein#enable_notification = 1
let g:dein#notification_time = 15
" Completion{{{2
" coc.nvim options{{{3
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-jedi',
            \ 'coc-json',
            \ 'coc-sh',
            \ 'coc-tag',
            \ 'coc-toml',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ 'coc-rust-analyzer',
            \ 'coc-go'
            \ ]
let g:coc_filetype_map = {
            \ 'jinja.html': 'html'
            \ }
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
" Integrations{{{2
" ale options{{{3
" coc.nvim communicates with LSP servers and forwards diagnostics to ALE
let g:ale_disable_lsp = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 750
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '?'
let g:ale_sign_stye_error = 'S!'
let g:ale_sign_style_warning = 'S?'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_use_global_executables = 1

let g:ale_linters = {
            \ 'c': ['clangtidy', 'cppcheck'],
            \ 'cpp': ['clangtidy', 'cppcheck'],
            \ 'python': ['flake8', 'pylint', 'mypy'],
            \ }

let g:ale_fixers = {
            \ 'c': ['clangtidy'],
            \ 'cpp': ['clangtidy'],
            \ }

let g:ale_c_clangtidy_checks = [
            \ 'bugprone-*',
            \ 'cert-*',
            \ 'clang-analyzer-*',
            \ 'darwin-*',
            \ 'google-*',
            \ 'misc-*',
            \ 'modernize-*',
            \ 'mpi-*',
            \ 'openmp-*',
            \ 'performance-*',
            \ 'portability-*',
            \ 'readability-*'
            \]

let g:ale_c_cppcheck_options = '--enable=style'
let g:ale_cpp_cppcheck_options = '--enable=style'
let g:ale_python_flake8_options = '--max-line-length=' . g:default_linelength
let g:ale_python_flake8_ignore_list = ['D', 'RST', 'E203', 'W503']
let g:ale_python_flake8_code_to_type = {
            \ 'F401': 'W',
            \ 'F841': 'W',
            \ }

let g:pylint_disable = [ 'global-statement', 'no-member' ]
let g:ale_python_pylint_options = '--disable=C,R --unsafe-load-any-extension=y --ignored-modules=numpy --disable=' . join(g:pylint_disable, ',')
let g:ale_python_mypy_options =  ' --ignore-missing-imports'
let g:ale_python_mypy_ignore_missing_stubs = 1

" Interface{{{2
" vim-airline options{{{3
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='gruvbox'
" vim-gitgutter options{{{3
let g:gitgutter_map_keys = 0
let g:gitgutter_diff_base = 'HEAD'

" Utility{{{2
" Quickscope{{{3
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#f653a6' gui=underline ctermfg=0 cterm=underline
highlight QuickScopeSecondary guifg='#e3ff4a' gui=underline ctermfg=50 cterm=underline

" Filesystem{{{2
" NERDTree{{{3

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['\.pdf$', '\.o$', '\.class$']

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusShowIgnored = 1
let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
" Language{{{2
" python-mode options{{{3
let g:pymode_rope = 0
let g:pymode_rope_completion = 0  " rope conflicts with other completions
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 120  " pyCharm default
let g:pymode_lint = 0  " solve conflicts with ale
let g:pymode_run = 0    " disable leader key bindings
let g:pymode_breakpoint = 0    " disable leader key bindings

" Debug{{{2
" vimspector{{{3
let g:vimspector_enable_mappings = 'HUMAN'

" Bindings{{{1
" General{{{2
let mapleader=" "
let maplocalleader=" "
" make `Y` consistent with other operations like `D` or `C`
nmap Y y$

noremap <UP> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <silent> qx :bp\|bd #<CR>
nnoremap <silent> qs :x<cr>
nnoremap <silent> qq :w<cr>
nnoremap <silent> qa :wa<CR>

vnoremap <Leader>y "*y
noremap <Leader>p "*p

" Filesystem{{{2

" Fzf & Telescope {{{3

if has('nvim')
    nnoremap <C-l> :Telescope live_grep<CR>
    nnoremap <C-e> :Telescope buffers<CR>

    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        nnoremap <leader>i :Telescope git_files<CR>
        nnoremap <C-c> :Telescope git_commits<CR>
    else
        nnoremap <leader>i :Telescope find_files<CR>
    endif
else
    nnoremap <C-L> :Rg<CR>
    nnoremap <C-e> :Buffers<CR>

    silent! !git rev-parse --is-inside-work-tree
    if v:shell_error == 0
        nnoremap <leader>i :GFiles<CR>
        nnoremap <C-c> :Commits<CR>
    else
        nnoremap <leader>i :Files<CR>
    endif
endif

" NERDTree {{{3
nnoremap <leader>q :NERDTreeToggle<CR>

" Git{{{2
nnoremap <C-x> :Git<CR>
nnoremap <Leader>gc :Git checkout 
nnoremap <Leader>gf :Git checkout feature/
nnoremap <Leader>gx :Git checkout fix/
nnoremap <Leader>gn :Git checkout -b 
nnoremap <Leader>gb :Git rebase 
nnoremap <Leader>gu :Git rebase upstream/develop<CR>
nnoremap <Leader>gsp :Git push<CR>
nnoremap <Leader>gsf :Git push -f<CR>

nnoremap <Leader>gdo :GitGutterDiffOrig<CR>

" Completion{{{2
" coc.nvim bindings{{{3
" Use tab and Shift-tab to navigate completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
  " remap for complete to use tab and <cr>
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ "\<Tab>"
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  inoremap <silent><expr> <c-space> coc#refresh()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()
" In original terminal vim, <C-Space> is <NUL>
imap <NUL> <C-Space>
nnoremap <silent> <leader><S-k> :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if ! (coc#rpc#ready() && CocAction('doHover'))
        normal K
    endif
endfunction
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<C-f>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<C-b>"
    xnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    xnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent><leader>ma <Plug>(coc-codeaction)
nmap <silent><leader>mq <Plug>(coc-fix-current)
nmap <silent><leader>mr <Plug>(coc-rename)
nmap <leader>mo :CocCommand clangd.ast<CR>
nmap <leader>ms :CocCommand clangd.switchSourceHeader<CR>

" vim-fugitive bindings{{{3
nnoremap <leader><S-d> :Gvdiff HEAD<CR>

" Interface{{{2
" vim-gitgutter bindings{{{3
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)
nmap <Leader><S-h> <Plug>(GitGutterUndoHunk)

" }}}

" Viewports{{{3

nnoremap <silent>> :vertical resize +3<CR>
nnoremap <silent>< :vertical resize -3<CR>

" }}}
" Tagbar{{{3
nnoremap <leader>vt :TagbarToggle<CR>
" Utility{{{2
map <Leader> <Plug>(easymotion-prefix)
nmap <Leader>c <Plug>(easymotion-jumptoanywhere)
" }}}
" Options{{{1
" Behavior{{{2
filetype plugin indent on
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
set autoindent
set autoread
set autowrite
set confirm
set expandtab
" Automatically remove comment leaders on line join and
" automatically add a comment leader on return
set formatoptions+=jr
" Do not insert the comment leader on `o` or `O` in normal mode
set formatoptions-=o
set encoding=UTF-8
set hidden
if exists("+inccommand")
    set inccommand=split
endif
set incsearch
set nrformats-=octal
set regexpengine=1
set shell=/bin/zsh
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set undodir=~/.vim/undo/
set undofile
set updatetime=750
set mouse-=a
set scrolloff=8

autocmd FileType c setlocal ts=2 sts=2 sw=2
autocmd FileType cpp setlocal ts=2 sts=2 sw=2
autocmd FileType cxx setlocal ts=2 sts=2 sw=2
autocmd FileType h setlocal ts=2 sts=2 sw=2
autocmd FileType hxx setlocal ts=2 sts=2 sw=2
autocmd FileType hpp setlocal ts=2 sts=2 sw=2
autocmd FileType cmake setlocal ts=2 sts=2 sw=2
autocmd FileType xml setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2

" Code display{{{2
set t_Co=256
set colorcolumn=+1
set cursorline
set hlsearch
set nowrap
set background=dark
colorscheme gruvbox

syntax on
if !has("gui_running")
    set termguicolors
endif
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

highlight Member guifg=#e06c75
highlight Variable guifg=#a4caf6
highlight Namespace guifg=#e5c07b
highlight Typedef guifg=#c678dd
highlight EnumConstant guifg=#98c379
highlight link CocSemEnumMember EnumConstant
highlight link CocSemNamespace Namespace
highlight link CocSemMethod Member
highlight link CocSemVariable Variable
highlight link CocSemParameter Variablen

" Interface{{{2
set fillchars=vert:│,fold:-
set laststatus=2
set lazyredraw
set number
set relativenumber
if has('nvim')
    set signcolumn=auto:2
else
    set signcolumn=auto
endif
set wildignore=*.o,*.obj,*.a,*.so,*.dylib,*.pyc,*.pdf
set wildmenu
set wildmode=longest:full,full
" 1}}}
"
" Commands{{{1
:command SourceVim source ~/.config/nvim/init.vim
" Functions{{{1
let s:mypy_flags = [
            \ 'py2',
            \ 'strict',
            \ 'ignore-missing-imports',
            \ 'disable-error-code=misc' ]
function! s:mypy_toggle(flag)
    if index(s:mypy_flags, a:flag) < 0
        echom 'Flag "' . a:flag . '" is unknown and thus cannot be toggled.'
        return
    endif
    let l:flag = '--' . a:flag
    let l:currently_enabled_flags = split(g:ale_python_mypy_options)
    let l:flag_index = index(l:currently_enabled_flags, l:flag)
    if l:flag_index < 0
        call add(l:currently_enabled_flags, l:flag)
    else
        call remove(l:currently_enabled_flags, l:flag_index)
    endif
    echom '"' . join(l:currently_enabled_flags, ', ') . '" flags will be enabled in future mypy runs.'
    let g:ale_python_mypy_options = join(l:currently_enabled_flags, ' ')
    ALELint
endfunction
function! s:complete_mypy_flags(A, L, P)
    return join(s:mypy_flags, "\n")
endfunction
command! -nargs=1 -complete=custom,<SID>complete_mypy_flags MypyToggle call <SID>mypy_toggle(<f-args>)

augroup coc_easy_motion_integration
    autocmd!
    autocmd User EasyMotionPromptBegin silent! CocDisable
    autocmd User EasyMotionPromptEnd silent! CocEnable
augroup END

function! s:git_gutter_diff_base(diff_base)
    let g:git_gutter_diff_base = a:diff_base
    GitGutter
endfunction

function! s:complete_git_branches(A, L, P)
    let l:branches = system("git branch -a | awk -F ' +' '! /\(no branch\)/ {print $2}' | sed 's/remotes\\\///'")
    if l:branches !~ '\v^fatal:\s'
        return "HEAD\n" . l:branches
    else
        return ''
    endif
endfunction

command! -nargs=1 -complete=custom,<SID>complete_git_branches GitGutterDiffBase call <SID>git_gutter_diff_base(<f-args>)

" vim: foldmethod=marker
