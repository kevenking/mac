set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

" ====================================

Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'Solarized'
Plugin 'virtualenv.vim'

" ====================================
" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

syntax on
set autoindent
set ruler
set showcmd
set incsearch
set hlsearch
set cursorline
set foldmethod=indent
set foldlevel=99
set completeopt=menuone,longest,preview
set showmatch
set nu
set relativenumber

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set backspace=start,eol,indent

" 设置vim界面风格
set background=dark
colorscheme solarized


" For NERDTree -------------------------------
" 使用F3开启NERDTree
map <F3> :NERDTreeToggle<CR>

" 在NERDTree中查找当前文件
nmap ,t :NERDTreeFind<CR>

" 设置NERDTree的屏蔽文件类型
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" 在NERDTree中显示行号
let NERDTreeShowLineNumbers = 1

" 
let NERDTreeAutoCenter = 1

" 是否显示隐藏文件
let NERDTreeShowHidden = 1

" 设置宽度
let NERDTreeWinSize = 31

" 显示书签列表
let NERDTreeShowBookmarks = 1


" 启动vim时自动启动NERDTree
autocmd vimenter * NERDTree

" 如果vim启动时指定了文件，则光标自动切换至文件窗口
autocmd VimEnter * if argc() != 0 | wincmd w | endif

" 当vim启动时如果未指定文件，则自动打开NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" 当所有文件都被关闭时，自动退出vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'


" CtrlP -----------------------------------
" 快捷键和命令（默认就是这个设置）
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" 搜索目录，.git所在目录，当前文件所在目录
let g:ctrlp_working_path_mode = 'ra'

" 忽略文件和目录
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" 忽略.gitignore中的文件
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" 搜索当前文件中的tags (symbols)
nmap ,g :CtrlPBufTag<CR>
" 所有文件中的tags (symbols)
nmap ,G :CtrlPBufTagAll<CR>
" 搜索文件中的代码
nmap ,f :CtrlPLine<CR>
" 搜索Vim命令
nmap ,c :CtrlPCmdPalette<CR>

" 不改变当前工作目录
let g:ctrlp_working_path_mode = 0


" tagbar ------------------------
map <F4> :TagbarToggle<CR>
autocmd VimEnter * nested :TagbarOpen

" airline --------------------------
let g:airline_powerline_fonts = 0
"let g:airline_theme = 'bubblegum'
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

nnoremap <C-N> :bn<CR>

" syntastic -----------------------
let g:airline#extensions#syntastic#enabled = 1
