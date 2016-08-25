" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug '907th/vim-auto-save'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'szw/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'Raimondi/delimitMate'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'othree/html5.vim'
Plug 'leafgarland/typescript-vim'
Plug 'itchyny/lightline.vim'
Plug 'PProvost/vim-ps1'
Plug 'valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
Plug 'tpope/vim-jdaddy'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'luochen1990/rainbow'
Plug 'altercation/vim-colors-solarized'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'suan/vim-instant-markdown'
call plug#end()


" Misc Editor Preferences
set ignorecase
set smartcase
set nospell
set nohlsearch
set nobackup
set noswapfile
set hidden
set number
set nowrap
set ttimeout
set ttimeoutlen=0
set clipboard+=unnamedplus
set shortmess=I
set nofoldenable
"let loaded_matchparen=1
let mapleader=";"

" Tabs
set softtabstop=4
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab
filetype plugin indent on

" 行列高亮
set cursorline
set cursorcolumn

" Style
let g:gruvbox_bold = 0
let g:gruvbox_italic = 0
let g:gruvbox_underline = 0
let g:gruvbox_undercurl = 0

colo gruvbox
set background=dark
set bg=dark
hi EndOfBuffer ctermfg=bg
set fillchars=

hi! link CursorLineNr LineNr
hi! VertSplit ctermbg=bg
hi! FoldColumn ctermbg=bg
hi! SignColumn ctermbg=bg
hi! GruvboxRedSign ctermfg=167 ctermbg=bg guifg=#fb4934 guibg=bg
hi! GruvboxGreenSign ctermfg=142 ctermbg=bg guifg=#b8bb26 guibg=bg
hi! GruvboxAquaSign ctermfg=108 ctermbg=bg guifg=#8ec07c guibg=bg
hi! GruvboxBlueSign ctermfg=109 ctermbg=bg guifg=#83a598 guibg=bg
hi! GruvboxRedSign ctermfg=167 ctermbg=bg guifg=#fb4934 guibg=bg

set numberwidth=4
set foldcolumn=2


" Light Line
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [],
    \             [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\}


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
let g:gitgutter_sign_column_always = 1


" Ctrl Space
let g:CtrlSpaceSearchTiming = 10


" Neomake
let g:neomake_echo_current_error=1
let g:neomake_verbose=0
autocmd BufWritePost *.rs NeomakeProject cargo
autocmd BufWritePost *.ts NeomakeProject typescript_project
autocmd BufWritePost *.ts Neomake tslint


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

" Format JSON
if has("python")
    python << EOF
import vim
import json
def FormatJSON(fmtlStart, fmtlEnd):
    fmtlStart = fmtlStart-1
    jsonStr = "\n".join(vim.current.buffer[fmtlStart:fmtlEnd])
    prettyJson = json.dumps(json.loads(jsonStr), sort_keys=True, indent=4, separators=(',', ': '), ensure_ascii=False)
    prettyJson = prettyJson.encode('utf8')
    vim.current.buffer[fmtlStart:fmtlEnd] = prettyJson.split('\n')
EOF
    com! -range -bar FmtJSON :python FormatJSON(<line1>, <line2>)
endif



" Turn off auto-insert of comments
" augroup auto_comment
"       au!
"       au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" augroup END

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

" rainbow highlight
let g:rainbow_active = 1
"0 if you want to enable it later via :RainbowToggle"

" let configuration work when you change this .vimrc file
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 代码块提醒
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
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
