" Plugins
call plug#begin('~/.vim/plugged')

" version control
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" completion
Plug 'valloric/YouCompleteMe'

" theme
Plug 'rakr/vim-one'

" lang
" markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

" js / html
Plug 'othree/html5.vim'
Plug 'marijnh/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'

" python
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'adrienverge/vim-python-logging'

" coffee
Plug 'kchmck/vim-coffee-script'

" tool
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate' "automatic closing of quotes, parenthesis, brackets, etc.
Plug 'tpope/vim-sensible' "provide some command preview
Plug 'thirtythreeforty/lessspace.vim' "clear the whitespace in the end of line automic
Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
call plug#end()


" Misc Editor Preferences
set termguicolors
"set t_Co=256
set ignorecase
set smartcase
set nospell
set nohlsearch
set nobackup
set noswapfile
set hidden
set relativenumber
set ttimeout
set ttimeoutlen=0
set clipboard+=unnamedplus
set shortmess=I
set nofoldenable
set novisualbell

" 闪屏设置
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"let loaded_matchparen=1
let mapleader=" "

set numberwidth=4
set foldcolumn=2

" 设置超过80长度提示
set colorcolumn=80


" 不折行
" set nowrap
" 折行
set wrap

" Tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab
filetype plugin indent on
syntax on

" 开启%匹配闭合标签
set nocompatible
filetype plugin on
runtime macros/matchit.vim

" 行列高亮
set cursorline
set cursorcolumn

" 主题
" set background=dark
" colorscheme violet

let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version

" airline 主题
"set laststatus=2
"let g:airline_theme='violet'


" html 标签补全
let g:closetag_html_style=1

" markdown preview
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

" <Leader> [1-9] move to window [1-9]
for s:i in range(1,9)
    execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
endfor

" <Leader><leader>[1-9] move to tab [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader><Leader>' . s:i . ' ' . s:i . 'gt'
endfor

" <Leader>b[1-9] move to buffer [1-9]
for s:i in range(1, 9)
  execute 'nnoremap <Leader>b' . s:i . ' :b' . s:i . '<CR>'
endfor

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip*=)
nmap ga <Plug>(EasyAlign)


" GUI
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h14
if has("gui_running")
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=999 columns=999 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions-=m       " 隐藏菜单栏
    set guioptions-=T       " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b        " 显示底部滚动条
    "set nowrap               " 设置不自动换行
endif

" Nerd Tree
map <silent> <Tab> :NERDTreeTabsToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMapHelp = '<f1>'
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "@",
    \ "Renamed"   : "-",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "x",
    \ "Dirty"     : "-",
    \ "Clean"     : "o",
    \ "Unknown"   : "?"
    \ }


" Git Gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
set signcolumn=yes

" Ctrl Space
let g:CtrlSpaceSearchTiming = 10


" Neomake
" let g:neomake_echo_current_error=1
" let g:neomake_verbose=0
" autocmd BufWritePost *.rs NeomakeProject cargo
" autocmd BufWritePost *.ts NeomakeProject typescript_project
" autocmd BufWritePost *.ts Neomake tslint


" Delimitmate
let g:delimitMate_backspace = 2
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
au FileType rust let b:delimitMate_quotes = "\""

" Smart Indent
function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()

" JSON 格式化
com! FormatJSON %!python3 -m json.tool

" CoffeeScript preview
com! CW :CoffeeWatch vert
com! CR :CoffeeRun vert


" 关闭自动注释
 augroup auto_comment
       au!
       au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
 augroup END

" Toggle paste ident
set pastetoggle=<F2>

" Set Copy to System clipboard
set clipboard=unnamed

" cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
        au InsertEnter,InsertChange *
            \ if v:insertmode == 'i' |
            \   silent execute '!echo -ne "\e[6 q"' | redraw! |
            \ elseif v:insertmode == 'r' |
            \   silent execute '!echo -ne "\e[4 q"' | redraw! |
            \ endif
          au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
      endif

" rainbow highlight
let g:rainbow_active = 1
"0 if you want to enable it later via :RainbowToggle"

" let configuration work when you change this .vimrc file
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 代码块提醒
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 代码折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Run Python Code
let g:pymode_run = 1

" 跳转函数定义 Ctrl + ]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" 不显示格式错误提示
let g:pymode_lint_cwindow = 0

" 查看代码格式错误快捷键
noremap <C-l> :lopen <CR>

" 格式化代码
noremap <F8> :PymodeLintAuto<CR>

" 自定义运行代码
noremap <silent> <C-b> <Esc>:w !python3 % <CR>

"tpl格式转换为html
au BufNewFile,BufRead *.xml,*.tpl set ft=html
