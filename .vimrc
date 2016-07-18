set nocompatible  "关闭vi兼容模式

syntax on  "语法高亮
colorscheme molokai  "default配色方案
set background=dark  "背景黑色
set t_Co=256  "256色
set number  "显示行号
set cursorline  "突出显示当前行
set ruler  "右下角状态行光标

set expandtab  "不要用空格替代制表符
set shiftwidth=4  "缩进为4,<<和>>移动4
set softtabstop=4  "退格键一次删掉4空格
set tabstop=4  "tab键缩进4

"set nobackup  "覆盖文件时不备份
"set autochdir  "自动切换当前目录为当前文件所在的目录
"set backupcopy=yes  "设置备份时的行为为覆盖

set ignorecase  "搜索忽略大小写
"set ignorecase smartcase  "搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan  "禁止在搜索到文件两端时重新搜索
set incsearch  "搜素高亮,搜索逐渐高亮
set hlsearch  "搜索时高亮显示被找到的文本

set showmatch  "高亮显示对应的括号,短暂地跳转到匹配的对应括号
set matchtime=6  "对应括号高亮时间(单位是十分之一秒)

set magic  "设置魔术?

set showcmd  "在状态栏显示正在输入的命令,未完成的指令片段也会显示出来
set smartindent  "智能对齐
set autoindent  "自动对齐
set mouse=a  "允许鼠标

set backspace=2  "more powerful backspacing?

set cmdheight=2  "命令行的高度,默认是1
set laststatus=1  "总是显示状态行
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\  "设置在状态行显示的信息

syntax enable
set foldenable  "开启折叠
set foldmethod=syntax  "设置语法折叠
set foldlevel=99  "默认情况下不折叠
"set foldcolumn=0  "设置折叠区域的宽度
"setlocal foldlevel=1  "设置折叠层数为1
"set foldclose=all  "设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>  "用空格键来开关折叠

set confirm  "在处理未保存或只读文件的时候,弹出确认框
set history=60  "历史纪录数
set modelines=0		"vim会在一个文件的前modelines行和后modelines行中寻找modeline命令

set gdefault  "行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1  "编码设置

set guifont=Menlo:h14:cANSI  "设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置
set scrolloff=1  "光标移动到buffer的顶部和底部时保持1行的距离
set autowrite  "在切换buffer时自动保存当前文件
set wildmenu  "增强模式中的命令行自动完成操作
set linespace=2  "字符间插入的像素行数目

"return OS type, eg: windows, or linux, mac, et.st..
"function! MySys()
"    if has("win16") || has("win32") || has("win64") || has("win95")
"        return "windows"
"    elseif has("unix")
"        return "linux"
"    endif
"endfunction

"用户目录变量$VIMFILES
"if MySys() == "windows"
"    let $VIMFILES = $VIM.'/vimfiles'
"elseif MySys() == "linux"
"    let $VIMFILES = $HOME.'/.vim'
"endif

"设定doc文档目录
"let helptags=$VIMFILES.'/doc'

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'  "C的主要Vim配置
Plugin 'Syntastic'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'beanworks/vim-phpfmt'
"Plugin 'alvan/vim-php-manual'
"Plugin 'joonty/vdebug.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'  "自动添加注释
Plugin 'minibufexpl.vim'  "最小化

"Optional
Plugin 'honza/vim-snippets'

call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"分为三部分命令:file on,file plugin on,file indent on 分别是自动识别文件类型,用文件类型脚本,使用缩进定义文件
filetype plugin on  "开启插件
filetype plugin indent on  "依文件类型设置自动缩进
filetype on  "打开文件类型检测功能

"----------------------------------------------------------
" NERD_commenter.vim 注释代码用，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1  "让注释符与语句之间留一个空格
let NERDCompactSexyComs=1  "多行注释时样子更好看
"let NERDTreeQuitOnOpen=1  "打开文件时关闭树
"let NERDTreeShowBookmarks=1  "显示书签
"let g:NERDDefaultAlign = 'left'  "Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDAltDelims_java = 1  "Set a language to use its alternate delimiters by default
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }  "Add your own custom formats or override the defaults


"Taglist插件设置
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let Tlist_Use_Right_Window = 1  "taglist显示在右侧
let Tlist_Exit_OnlyWindow = 1  "taglist只剩一个窗口时自动关闭
let Tlist_File_Fold_Auto_Close = 1  "自动折叠当前非编辑文件的方法列表
"let Tlist_Show_One_File = 1  "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Auto_Open = 0
"let Tlist_Auto_Update = 1
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Process_File_Always = 1
"let Tlist_Display_Prototype = 0
"let Tlist_Compact_Format = 1

"关闭/打开配对括号高亮
"NoMatchParen
"DoMatchParen

"用浅色高亮当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"开启normal 或visual模式下的backspace键空格键，左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能
set whichwrap=b,s,<,>,[,]

"minibufexpl最小化文件标头
let g:miniBufExplMapWindowNavVim=1  "按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows=1  "按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
"启用以下两个功能:Ctrl+tab移到下一个buffer并在当前窗口打开;Ctrl+Shift+tab移到上一个buffer并在当前窗口打开;ubuntu好像不支持
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapCTabSwitchWindows=1  "启用以下两个功能:Ctrl+tab移到下一个窗口;Ctrl+Shift+tab移到上一个窗口;ubuntu好像不支持
let g:miniBufExplModSelTarget=1  "不要在不可编辑内容的窗口(如TagList窗口)中打开选中的buffer

set omnifunc=syntaxcomplete#Complete
highlight Pmenu ctermfg=13 ctermbg=0 guifg=#ffffff guibg=#0000ff

set shortmess+=I

"insert mode: ctrl+u  turn  the current word to uppercase
inoremap <c-u> <esc>bveUi


let mapleader = ","
map <leader>ne :NERDTreeToggle<CR>
map <leader>tl :TlistToggle<CR>
map <leader>tb :TagbarToggle<CR>
"最小化文件标头
nmap <leader>mme :MiniBufExplorer<CR>
nmap <leader>mmc :CMiniBufExplorer<CR>
nmap <leader>mmu :UMiniBufExplorer<CR>
nmap <leader>mmt :TMiniBufExplorer<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"grep
nnoremap <leader>g :silent execute "grep! -R " .  shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
"为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>


"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif  "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"  "回车即选中当前项
"上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>  "跳转到定义处
let g:ycm_complete_in_comments=1  "在注释输入中也能补全
let g:ycm_complete_in_strings=1  "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=0  "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files=1  "开启YCM基于标签引擎,可以在这之后添加需要的标签路径
let g:ycm_min_num_of_chars_for_completion=2  "从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  "禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1  "语法关键字补全
"Youcompleteme 默认tab s-tab和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0  "关闭加载.ycm_extra_conf.py提示
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"let g:ycm_key_invoke_completion = '<M-;>'  "修改对C函数的补全快捷键，默认是CTRL+space,修改为ALT+;
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>  "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>  "open locationlist
"nnoremap <leader>lc :lclose<CR>  "close locationlist
inoremap <leader><leader> <C-x><C-o>


"对搜索的设置
map ft :call Search_Word()<CR>:copen<CR>

function Search_Word()
   let w = expand("<cword>") "在当前光标位置抓词
   execute "vimgrep " . w . " *"
endfunction

autocmd VimEnter * echo "Tyrion"
