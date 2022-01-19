
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'nvim-lualine/lualine.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'karb94/neoscroll.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/which-key.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Rust
Plug 'rust-lang/rust.vim'
Plug 'puremourning/vimspector'

Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end() 

set nu
set hidden
set clipboard+=unnamedplus
" Set Copy to System clipboard
set clipboard=unnamed
set termguicolors

set encoding=utf8

syntax enable
filetype plugin on
filetype plugin indent on

" tab 缩进
set autoindent
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格

set guifont=FiraCode\ Nerd\ Font\ Mono:h16

" window
let mapleader=" "
:cd ~

" <Leader> [1-9] move to window [1-9]
for s:i in range(1,9)
    execute 'nnoremap <Leader>' . s:i . ' :' . s:i . 'wincmd w<CR>'
endfor


let g:neovide_cursor_trail_length=0
let g:neovide_cursor_animation_length=0.018
let g:neovide_cursor_vfx_mode = "pixiedust"

" which key
set timeoutlen=400

" Config
map <leader>ss :e ~/.config/nvim/init.vim<cr>
" auto insert ;
map <c-;> $a;<cr>

"FZF
let g:fzf_preview_window = []
map <leader>g :GFiles<CR>
map <leader>p :FZF<CR>
map <c-b> :Buffers<CR>
map <leader>a :Ag<CR>
map <leader>r :Rg<CR>

"COQ
let g:coq_settings = { 'auto_start': 'shut-up' }

"COC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


"GO
"let g:go_fmt_command = "goimports"
"map <leader>i :GoImpl<CR>

"Rust
let g:rustfmt_autosave = 1
let g:vimspector_enable_mappings = 'HUMAN'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" nerdtree
map <silent> <Tab> :NERDTreeTabsToggle<CR>
map <leader>f :NERDTreeFind<cr>
nnoremap <leader>n :NERDTree .<CR>
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeWinPos = "left"
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


"---------------------------------- LUA Config ----------------------------------

lua <<EOF
-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false

vim.cmd([[
set shell=fish
]])

-- Load the colorscheme
require('nord').set()

require('lualine').setup({
          options = {
        	theme = 'nord',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
          }
})

local lspconfig = require "lspconfig"
-- local coq = require "coq" 
-- 
-- lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
--     cmd = {"/Users/wanglei/go/bin/gopls", "serve"},
--     settings = {
--       gopls = {
--         analyses = {
--           unusedparams = true,
--         },
--         staticcheck = true,
--       },
--     },
--   }))
-- 
-- lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
-- }))

require("toggleterm").setup({
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-k>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float' ,
  close_on_exit = true -- close the terminal window when the process exits
})

require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }

require('neoscroll').setup({
	mappings = {'<C-u>', '<C-d>'}
})

EOF

