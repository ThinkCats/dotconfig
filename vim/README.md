vimrc
===

我的vim配置，基础版本fork自[一个NeoVim的配置文件](https://github.com/TyOverby/nvim)，当前迁移到了vim中，并且添加了一些扩展(行列提醒，代码折叠，代码块提示等)，适合于开发JavaScript,Html,Css应用，并且可用于编写markdown（采用suan/vim-instant-markdown插件，需有nodejs工具支持）。

最近用了下python，发现vim作为python编辑器，貌似定制性很高，于是折腾了一把。

### 2016.9.23
好吧，为了在当前窗口中显示文件运行的结果，大费周章，终于解决了，还是靠vim比较靠谱，插件茫茫多，各有自己的长处，却不是我想要的。命令前一个 ':w' 就可以实现不跳出窗口了。
运行代码仍为Ctrl+b，显示当前窗口文件的运行结果.


### 2016.9.18
增加快捷键F8自动格式化代码，Ctrl+b 运行代码

### 2016.9.17更新
增加python支持

```
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
```


### 插件列表
```bash
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
...
...
```

