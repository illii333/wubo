" 插件管理器初始化
call plug#begin('~/.vim/plugged')

" 核心插件：文件树 + 语法高亮
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" 系统剪贴板支持（复制粘贴）
Plug 'tpope/vim-eunuch' " 辅助系统操作，增强剪贴板兼容性

" 结束插件定义
call plug#end()

" ========== 基础配置 ==========
" 显示行号
"set number
" 关闭错误提示音
"set noerrorbells
" 启用 Vim 特性（不兼容 Vi）
set nocompatible
" 系统剪贴板共享
set clipboard=unnamedplus
" 语法高亮
"syntax on
" 显示当前模式（如 INSERT）
"set showmode
" 显示输入的命令
"set showcmd
" 鼠标支持（可点击、滚动）
set mouse=a
" 自动切换工作目录为当前文件所在目录
set autochdir
" 缩进配置（制表符转空格，宽度 4）
set tabstop=4
set shiftwidth=4
set expandtab
" 高亮当前行
"set cursorline
" 总是显示状态栏
set laststatus=2
" 显示光标位置
"set ruler
" 搜索高亮 + 增量搜索 + 智能大小写
set hlsearch
set incsearch
set ignorecase
set smartcase
" 显示不可见字符（制表符、 trailing 空格）
set listchars=tab:»·,trail:·
set list
set number
" 命令行自动补全
set wildmenu
set wildmode=longest:list,full

" ========== 插件映射 ==========
" 空格为 leader 键，映射 NERDTree 开关
let mapleader = " "   
map <leader>n :NERDTreeToggle<CR>

" ========== 语言特定快捷键 ==========
" Python 文件：F5 保存并运行
autocmd FileType python nnoremap <buffer> <F5> :w<CR>:!python %<CR>
" C++ 文件：F5 保存、编译并运行
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ % -o %:r && ./%:r<CR>

" 自动补全各类括号/符号并将光标置于中间
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <>><Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" 花括号回车增强（适合代码块）
inoremap {<CR> {<CR>}<ESC>O

" 尖括号回车增强（适合HTML/XML标签块，自动缩进）
inoremap <<CR> <<CR>><ESC>O

