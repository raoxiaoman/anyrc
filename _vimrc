"佛祖保佑 永无BUG
"佛曰:
"写字楼里写字间，写字间里程序员；
"程序人员写程序，又拿程序换酒钱。
"酒醒只在网上坐，酒醉还来网下眠；
"酒醉酒醒日复日，网上网下年复年。
"但愿老死电脑间，不愿鞠躬老板前；
"奔驰宝马贵者趣，公交自行程序员。
"别人笑我忒疯癫，我笑自己命太贱；
"不见满街漂亮妹，哪个归得程序员？

" 配置多语言环境,解决中文乱码问题
if has("multi_byte") 
    " UTF-8 编码 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif
"解决consle提示信息输出乱码
language messages zh_CN.utf-8

"设置编码
set encoding=utf-8
"设置行号
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 根据Python语言的建议（将tab展成四个空格）进行了专门设置
autocmd FileType python setlocal et sta sw=4 sts=4
" 让vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 解决插入模式下delete/backspce键失效问题
set backspace=2
"设置关闭兼容模式
set nocompatible
"设置命令模式补全列表
set wildmenu
"设置vim切换buffer(文件/tab)后仍然保留undo,
"不用保存后才能打开新的buf
set hidden
"设置字体
set guifont=Courier_New:h12:cANSI
" 设置leader键
let mapleader=","

"让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ESC不方便,设置fd快捷键代替
"imap <C-I> <Esc>
inoremap fd <Esc>

" 设置保存快捷键
map <leader>w :w<CR>
imap <leader>w <C-o>:w<CR>

" 设置保存退出快捷键
nnoremap zz :wq<CR>

"设置插件管理,需要配置vim路径的环境变量
set rtp+=$VIM\vimfiles\bundle\Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"my bundle plugin
Plugin 'tomasr/molokai'
"功能：状态栏和标签页,主题
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"功能：git修改显示
Plugin 'mhinz/vim-signify'
"功能：vim里面使用git
Plugin 'tpope/vim-fugitive'
"功能:"代码块补全引擎,快捷键：<leader><Tab>,windows下对于官方版的gvim。使用插件需要安装32位的Python27,并配置环境变量
Plugin 'SirVer/ultisnips'
"功能：代码块集合
Plugin 'honza/vim-snippets'
"功能：文本对齐
Plugin 'junegunn/vim-easy-align'
"功能：代码注释,快捷键：<Leader>c<space>
Plugin 'scrooloose/nerdcommenter'
"功能：代码错误提示异步
Plugin 'w0rp/ale'
"功能：列出当前路径的目录树,快捷键：<leader>l
Plugin 'scrooloose/nerdtree'
"功能：光标跳转（匹配两个字符）,快捷键：s
Plugin 'justinmk/vim-sneak'
"功能：光标跳转（匹配所有字符）,快捷键：/
Plugin 'easymotion/vim-easymotion'
"功能：多光标选中,快捷键：ctrl+n
Plugin 'terryma/vim-multiple-cursors'
"功能：c++函数定义自动生成函数实现,快捷键：<leader>PP
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
"功能：c++在.h和.cpp文件间跳转,用法：命令模式输入命令A
Plugin 'vim-scripts/a.vim'
"功能：各种配对符号自动补全
Plugin 'jiangmiao/auto-pairs'
"当前目录文件搜索
Plugin 'kien/ctrlp.vim'
"功能：列出当前代码的函数树,需要安装ctags.exe
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

" 设置主题颜色为molokai
set nu!
syntax enable 
syntax on
colorscheme molokai

"设置模板补全插件UltiSnips
"tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["C:\Users\Administrator.OEUZ9I7DHOU3LM9\.vim\bundle\vim-snippets\UltiSnips"]

" 设置文件中光标快速移动插件EasyMotion
let g:EasyMotion_do_mapping = 0
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" 设置文件视图插件NERDTReeToggle
" 快捷键
map <leader>l :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=35
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"设置vim_airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>

" 设置相同多光标控制插件multi_cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

"设置由借口快速生成实现框架插件pullproto(快捷键<leader>PP,<leader>PN)
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='C:\Users\Administrator.OEUZ9I7DHOU3LM9\.vim\bundle\vim-protodef\pullproto.pl'

" 设置代码检查ale
set nocompatible
filetype off
let &runtimepath.='C:\Users\Administrator.OEUZ9I7DHOU3LM9\.vim\bundle\ale'
filetype plugin on
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

"设置开关quickfix窗口
nnoremap <leader>q :call QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" 设置function视图插件tagbar的信息
" 设置 tagbar 子窗口的位置出现在主编辑区的右边
let tagbar_right=1
" 设置显示／隐藏标签列表子窗口的快捷键。
nnoremap <F5> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
            \ 'kinds' : [
            \ 'c:classes:0:1',
            \ 'd:macros:0:1',
            \ 'e:enumerators:0:0',
            \ 'f:functions:0:1',
            \ 'g:enumeration:0:1',
            \ 'l:local:0:1',
            \ 'm:members:0:1',
            \ 'n:namespaces:0:1',
            \ 'p:functions_prototypes:0:1',
            \ 's:structs:0:1',
            \ 't:typedefs:0:1',
            \ 'u:unions:0:1',
            \ 'v:global:0:1',
            \ 'x:external:0:1'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
            \ 'g' : 'enum',
            \ 'n' : 'namespace',
            \ 'c' : 'class',
            \ 's' : 'struct',
            \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
            \ 'enum'      : 'g',
            \ 'namespace' : 'n',
            \ 'class'     : 'c',
            \ 'struct'    : 's',
            \ 'union'     : 'u'
            \ }
            \ }

"设置行号
set number

