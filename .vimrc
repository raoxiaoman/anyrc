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

"设置插件管理
""需要先安装插件vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
"功能：在当前目录下所有文件的内容查找目标单词
Plug 'dyng/ctrlsf.vim'
"功能：在当前目录查找目标文件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"功能：vim主题
Plug 'dracula/vim'
Plug 'tomasr/molokai'
"功能：状态栏和标签页,主题
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"功能：代码补全以及代码函数跳转
Plug 'Valloric/YouCompleteMe',{'do': './install.sh --clang-completer' }
"功能：生成YouCompleteMe的配置文件
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"功能：git修改显示
Plug 'mhinz/vim-signify'
"功能：vim里面使用git
Plug 'tpope/vim-fugitive'
"功能：vim里面使用GNU GLOBAL，需要先安装GNU GLOBAL(https://www.gnu.org/software/global/)
Plug 'aceofall/gtags.vim'
"功能：代码格式化
Plug 'Chiel92/vim-autoformat'
"功能: 代码块补全引擎
Plug 'SirVer/ultisnips'
"功能：代码块集合
Plug 'honza/vim-snippets'
"功能：文本对齐
Plug 'junegunn/vim-easy-align'
"功能：代码自动缩进
Plug 'nathanaelkane/vim-indent-guides'
"功能：代码注释
Plug 'scrooloose/nerdcommenter'
"功能：代码错误提示异步
Plug 'w0rp/ale'
"功能：列出当前代码的函数树,需要安装ctags(sudo apt-get install ctags)
Plug 'majutsushi/tagbar'
"功能：列出当前路径的目录树
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"功能：光标跳转（匹配两个字符）
Plug 'justinmk/vim-sneak'
"功能：光标跳转（匹配所有字符）
Plug 'easymotion/vim-easymotion'
"功能：在当前目录查找目标文件
Plug 'rking/ag.vim'
"功能：多光标选中
Plug 'terryma/vim-multiple-cursors'
"功能：c++函数定义自动生成函数实现
Plug 'derekwyatt/vim-protodef'
"功能：c++在.h和.cpp文件间跳转
Plug 'derekwyatt/vim-fswitch'
"功能：各种配对符号自动补全
Plug 'jiangmiao/auto-pairs'
"功能：异步命令
Plug 'skywind3000/asyncrun.vim'
call plug#end()

"设置编码
set encoding=utf-8
"设置行号
set number
"设置换行和缩进
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让vim 把连续数量的空格视为一个制表符
set softtabstop=4
set backspace=2
"设置关闭兼容模式
set nocompatible
"设置命令模式补全列表
set wildmenu
"set wildmode=list:full

" 设主题颜色为dracula
if !empty(glob("~/.vim/plugged/vim/colors/dracula.vim"))
    syntax on
    set t_Co=256
    set background=dark
    colorscheme dracula
    hi Normal ctermfg=white ctermbg=black
endif

" 设置主题颜色为molokai
"let g:rehash256 = 1
"colorscheme molokai

" 设置leader键
let mapleader=","

" 设置背景在黑色和透明间切换
map <leader>bn :hi Normal ctermfg=white ctermbg=none<CR>
map <leader>nb :hi Normal ctermfg=white ctermbg=black<CR>

"让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 设置代码大括号间联系插件indent_guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键i开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" ESC不方便,设置fd快捷键代替
"imap <C-I> <Esc>
inoremap fd <Esc>

"设置模板补全插件UltiSnips
"tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["~/.vim/mysnippets"]

"设置YouCompleteMe代码补全和跳转插件
if !empty(glob("~/.vim/plugged/YouCompleteMe/third_party/ycmd/ycm_core.so"))
    " YCM 补全菜单配色
    "选中项
    nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
    highlight Pmenu ctermfg=3 ctermbg=0  guifg=#005f87 guibg=#EEE8D5
    let g:ycm_global_ycm_extra_conf = '/home/raohui/.ycm_extra_conf.py'
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项"
    nnoremap <C-b> :YcmCompleter GoTo <CR>
    " 补全功能在注释中同样有效
    let g:ycm_complete_in_comments=1
    " 允许 vim 加载 .ycm_extra_conf.py 文件
    let g:ycm_confirm_extra_conf=0
    " 开启 YCM 标签补全引擎
    let g:ycm_collect_identifiers_from_tags_files=1
    " 引入 C++ 标准库tags
    set tags+=/home/raohui/.vim/tags/stdcpp.tags
    " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
    inoremap <leader>; <C-x><C-o>
    " 补全内容不以分割子窗口形式出现，只显示补全列表
    set completeopt-=preview
    " 禁止缓存匹配项，每次都重新生成匹配项
    let g:ycm_cache_omnifunc=0
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_key_invoke_completion = '<C-a>'
endif

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

" 使用 ctrlsf.vim插件在工程内全局查找光标所在关键字，设置快捷键。
let g:ctrlsf_ackprg = 'ag'
nnoremap <C-f> :CtrlSF

"设置标签生成插件gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
au VimEnter * call VimEnterCallback()
au BufAdd *.[ch] call FindGtags(expand('<afile>'))
au BufWritePost *.[ch] call UpdateGtags(expand('<afile>'))

function! FindFiles(pat, ...)
    let path = ''
    for str in a:000
        let path .= str . ','
    endfor

    if path == ''
        let path = &path
    endif

    echo 'finding...'
    redraw
    call append(line('$'), split(globpath(path, a:pat), '\n'))
    echo 'finding...done!'
    redraw
endfunc

function! VimEnterCallback()
    for f in argv()
        if fnamemodify(f, ':e') != 'c' && fnamemodify(f, ':e') != 'h'
            continue
        endif

        call FindGtags(f)
    endfor
endfunc

function! FindGtags(f)
    let dir = fnamemodify(a:f, ':p:h')
    while 1
        let tmp = dir . '/GTAGS'
        if filereadable(tmp)
            exe 'cs add ' . tmp . ' ' . dir
            break
        elseif dir == '/'
            break
        endif

        let dir = fnamemodify(dir, ":h")
    endwhile
endfunc

function! UpdateGtags(f)
    let dir = fnamemodify(a:f, ':p:h')
    exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
endfunction

"设置格式化插件autofarmat
noremap <F4> :Autoformat<CR>
let g:autoformat_verbosemode=1

"设置vim_airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <F2> :bn<CR>
nnoremap <F3> :bp<CR>

" 设置搜索文件插件FZF快捷键
map <C-p> :FZF<CR>

" 设置相同多光标控制插件multi_cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

"设置由借口快速生成实现框架插件pullproto
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" 设置代码检查ale
set nocompatible
filetype off
let &runtimepath.=',~/.vim/plugged/ale/'
filetype plugin on
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" 设置保存快捷键
map <leader>w :w<CR>
imap <leader>w <C-o>:w<CR>

" 设置保存退出快捷键
nnoremap zz :wq<CR>

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
