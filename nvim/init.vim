
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'nvim-lualine/lualine.nvim'
Plug 'shaunsingh/nord.nvim'
"Plug 'karb94/neoscroll.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" auto complete symbols
Plug 'Raimondi/delimitMate'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end() 

set nu
set background=light
set clipboard+=unnamedplus
" Set Copy to System clipboard
set clipboard=unnamed
set termguicolors

syntax enable

set guifont=FiraCode\ Nerd\ Font\ Mono:h15

" window
let mapleader=" "

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


map <leader>ss :e ~/.config/nvim/init.vim<cr>

"FZF
let g:fzf_preview_window = []
map <leader>g :GFiles<CR>
map <leader>p :FZF<CR>
map <leader>b :Buffers<CR>
map <leader>a :Ag<CR>
map <leader>r :Rg<CR>

"COQ
let g:coq_settings = { 'auto_start': 'shut-up' }

" nerdtree
map <silent> <Tab> :NERDTreeTabsToggle<CR>
map <leader>f :NERDTreeFind<cr>
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

if exists('g:nvui')
  " Configure nvui
  NvuiCmdFontFamily Jetbrains Mono
  NvuiCmdFontSize 25.0
  NvuiScrollAnimationDuration 0.2
endif

lua <<EOF
-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false

-- Load the colorscheme
require('nord').set()

--require('neoscroll').setup()

require('lualine').setup({
          options = {
        	theme = 'nord',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' }
          }
})

local lspconfig = require "lspconfig"
local coq = require "coq" 
lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }))



EOF

