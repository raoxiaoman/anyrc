"佛祖保佑 永无BUG
"佛曰: "写字楼里写字间，写字间里程序员； 
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
"功能：在当前目录下所有文件的内容中查找目标单词,
"需先安装ag(sudo apt-get install silversearcher-ag),快捷键：ctrl+f
Plug 'dyng/ctrlsf.vim',{'on': 'CtrlSF'}
"功能：在当前目录查找目标文件,快捷键ctrl+p
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"功能：vim主题
Plug 'tomasr/molokai'
"功能：状态栏和标签页,主题,字体
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
"功能：代码补全以及代码函数跳转,快捷键：ctrl+b
Plug 'Valloric/YouCompleteMe',{'do': './install.sh --clang-completer --java-completer --js-completer' }
"功能：生成YouCompleteMe的配置文件,用法：config_gen.py .
Plug 'rdnetto/YCM-Generator', { 'on': 'YcmGenerateConfig','branch':'stable' }
"功能：git修改显示
Plug 'mhinz/vim-signify'
"功能: 代码块补全引擎,快捷键：<leader><Tab>
Plug 'SirVer/ultisnips'
"功能：代码块模板库
Plug 'honza/vim-snippets'
"功能：文本对齐
Plug 'junegunn/vim-easy-align'
"功能：代码注释,快捷键：<Leader>c<space>
Plug 'scrooloose/nerdcommenter'
"功能：代码错误提示异步
Plug 'w0rp/ale'
"功能: 函数查找 目录当前文件查找 tag查找 buff查找 快捷键<leader> + lt or lf or lb
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"功能：列出当前路径的目录树,快捷键：<c-l>
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"功能：光标跳转（匹配两个字符）,快捷键：s
Plug 'justinmk/vim-sneak'
"功能：光标跳转（匹配所有字符）,快捷键：/
Plug 'easymotion/vim-easymotion'
"功能：多光标选中,快捷键：ctrl+n
Plug 'terryma/vim-multiple-cursors'
"功能：c++函数定义自动生成函数实现,快捷键：<leader>PP
Plug 'derekwyatt/vim-protodef'
Plug 'derekwyatt/vim-fswitch'
"功能：c++在.h和.cpp文件间跳转,用法：命令模式输入命令A
Plug 'vim-scripts/a.vim',{ 'on': 'A' }
"功能：各种配对符号自动补全
Plug 'jiangmiao/auto-pairs'
"功能：异步命令
Plug 'skywind3000/asyncrun.vim',{'on': 'AsyncRun'}
"功能：MarkDown文档预览
Plug 'iamcco/mathjax-support-for-mkdp',{'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim',{'for': 'markdown'}
"功能：中文输入法问题
Plug 'vim-scripts/fcitx.vim'
"功能: ctags和gtags自动生成和管理,
"vim里面使用GNU GLOBAL，需要先安装GNU GLOBAL(https://www.gnu.org/software/global/)
"需要安装ctags(sudo apt-get install ctags)
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
"功能: 函数参数提示
Plug 'Shougo/echodoc.vim'
"功能: 预览tag
Plug 'skywind3000/vim-preview',{ 'on': 'PreviewQuickfix' }
"功能: 定义了一系列方括号开头的快捷键
Plug 'tpope/vim-unimpaired'
"功能: 管理gtags(被gutentags代替)
"Plug 'aceofall/gtags.vim'
"功能：MarkDown文档编辑(molokai配色已经自带,这个作为补充)
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
"功能：函数补全的同时添加参数
"Plug 'tenfyzhong/CompleteParameter.vim'
"功能：java代码补全
"Plug 'artur-shaik/vim-javacomplete2'
"功能：vim里面使用git
"Plug 'tpope/vim-fugitive'
call plug#end()

"设置编码
set encoding=utf-8
"设置行号
set number
"设置换行和缩进
set smartindent
" 自适应不同语言的智能缩进
filetype indent on
" 根据文件类型添加插件
filetype plugin on
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
"设置高亮
syntax enable
syntax on
"设置鼠标模式
set mouse=a
"设置搜索高亮
"set hlsearch

" 设置主题颜色为molokai
set t_Co=256
let g:rehash256 = 1
colorscheme molokai

" 设置leader键
let mapleader=","

" 设置特殊文件的filetype
au BufRead,BufNewFile *.{cc,hpp} set filetype=cpp
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
"设置MarkDown不自动折叠
let g:vim_markdown_folding_disabled = 1
"设置MarkDown文档pyhon-mode主题
let g:vim_markdown_folding_style_pythonic = 1
"设置支持yaml语法
let g:vim_markdown_frontmatter=1 

" 设置背景在黑色和透明间切换
map <leader>bn :hi Normal ctermfg=white ctermbg=none<CR>
map <leader>nb :hi Normal ctermfg=white ctermbg=black<CR>

" ESC不方便,设置fd快捷键代替
"imap <C-I> <Esc>
inoremap fd <Esc>

" 设置保存快捷键
map <leader>w :w<CR>
imap <leader>w <C-o>:w<CR>

" 设置保存退出快捷键
nnoremap zz :wq<CR>

"设置切换Buffer快捷键"
nnoremap <C-j> :bn<CR>
noremap <C-k> :bp<CR>

"处理alt键不能识别的问题
function! Terminal_MetaMode(mode)
    set ttimeout
    if $TMUX != ''
        set ttimeoutlen=30
    elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
        set ttimeoutlen=80
    endif
    if has('nvim') || has('gui_running')
        return
    endif
    function! s:metacode(mode, key)
        if a:mode == 0
            exec "set <M-".a:key.">=\e".a:key
        else
            exec "set <M-".a:key.">=\e]{0}".a:key."~"
        endif
    endfunc
    for i in range(10)
        call s:metacode(a:mode, nr2char(char2nr('0') + i))
    endfor
    for i in range(26)
        call s:metacode(a:mode, nr2char(char2nr('a') + i))
        call s:metacode(a:mode, nr2char(char2nr('A') + i))
    endfor
    if a:mode != 0
        for c in [',', '.', '/', ';', '[', ']', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    else
        for c in [',', '.', '/', ';', '{', '}']
            call s:metacode(a:mode, c)
        endfor
        for c in ['?', ':', '-', '_']
            call s:metacode(a:mode, c)
        endfor
    endif
endfunc
call Terminal_MetaMode(0)

"设置在vim打开sh窗口
nnoremap <leader>vt :vertical terminal++close<CR>
nnoremap <leader>t :terminal++close<CR>
tnoremap <leader>wc  <C-W><C-c> 

"让配置立即生效(会很容易让.vimrc卡住)
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"设置模板补全插件UltiSnips
"tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"设置YouCompleteMe代码补全和跳转插件
function! Config_Youcompleteme()
    " YCM 补全菜单配色
    highlight Pmenu ctermfg=3 ctermbg=0  guifg=#005f87 guibg=#EEE8D5
    let g:ycm_global_ycm_extra_conf = '/home/raohui/.ycm_extra_conf.py'
    "回车即选中当前项
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"    
    "设置跳转快捷键
    nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
    nnoremap <C-b> :YcmCompleter GoTo <CR>
    " 补全功能在注释中同样有效
    let g:ycm_complete_in_comments=1
    " 允许 vim 加载 .ycm_extra_conf.py 文件
    let g:ycm_confirm_extra_conf=0
    " 开启 YCM 标签补全引擎
    let g:ycm_collect_identifiers_from_tags_files=1
    " 禁止缓存匹配项，每次都重新生成匹配项
    "let g:ycm_cache_omnifunc=0
    " 语法关键字补全
    let g:ycm_seed_identifiers_with_syntax=1
    let g:ycm_key_invoke_completion = '<c-a>'
    let g:ycm_add_preview_to_completeopt = 0
    let g:ycm_show_diagnostics_ui = 0
    let g:ycm_server_log_level = 'info'
    let g:ycm_min_num_identifier_candidate_chars = 2
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_complete_in_strings=1
    set completeopt=menu,menuone
    noremap <c-a> <NOP>
    let g:ycm_semantic_triggers =  {
                \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                \ 'cs,lua,javascript': ['re!\w{2}'],
                \ }
endfunction
call Config_Youcompleteme()

"设置AsyncRun插件
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" 设置java C++ C 的编译和运行快捷键
"c/c++
nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <silent> <F7> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
"java 需要安装Maven
nnoremap <silent> <M-F9> :AsyncRun -raw  mvn -f $(VIM_FILEDIR)/../../../../../pom.xml compile <cr>
nnoremap <silent> <M-F5> :AsyncRun -raw  mvn -f $(VIM_FILEDIR)/../../../../../pom.xml exec:java -Dexec.mainClass="com.raohui.$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <S-F5> :AsyncRun -raw  mvn -f $(VIM_FILEDIR)/../../../../../pom.xml test <cr>

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
map <c-l> :NERDTreeToggle<CR>
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

" 使用 ctrlsf.vim插件,在工程内全局查找光标所在关键字，设置快捷键。
let g:ctrlsf_ackprg = 'ag'
nnoremap <C-f> :CtrlSF<SPACE>

"设置标签生成插件gtags.vim 设置项
"let GtagsCscope_Auto_Load = 1
"let CtagsCscope_Auto_Map = 1
"let GtagsCscope_Quiet = 1
"set cscopetag " 使用 cscope 作为 tags 命令
"set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-

"设置vim_airline插件
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_symbols.branch = 'branch'
"let g:airline_symbols.branch = '⎇'

" 设置搜索文件插件FZF快捷键
"map <leader>fz :FZF<CR>

" 设置相同多光标控制插件multi_cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<M-q>'
let g:multi_cursor_quit_key='<Esc>'

"设置由借口快速生成实现框架插件pullproto(快捷键<leader>PP,<leader>PN)
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1
" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'

" 设置代码检查插件ale
set nocompatible
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = { 'cpp': ['clang'],'c': ['clang'],'cc': ['clang']}
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"let g:ale_sign_error = ">>"
let g:ale_sign_warning = "w"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"设置MarkDown文档预览插件快捷键
"普通模式
nmap <silent> <leader>md <Plug>MarkdownPreview        
"插入模式
imap <silent> <leader>md <Plug>MarkdownPreview         
"普通模式
nmap <silent> <Leader>smd <Plug>StopMarkdownPreview    
"插入模式
imap <silent> <leader>smd <Plug>StopMarkdownPreview    

"设置auto-pair插件的匹配符号
let g:AutoPairs = { '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '(':')' } 

"设置gutentags插件(tags自动生成,代替gtags)
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
"避免不同项目的gtags混淆
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif
" 检测 ~/.cache/tags 不存在就新建
let s:vim_tags = expand('~/.cache/tags')
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" 设置忽略某些类型的文件,不生成tags
function! MyCustomGutentagsEnableFunc(path) abort
    let endof = fnamemodify(a:path, ':e')
    return endof != 'md' && endof != 'markdown' 
endfunction
let g:gutentags_enabled_user_func = 'MyCustomGutentagsEnableFunc'

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

"设置插件LeaderF(代替fzf)
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<leader>lb'
noremap <leader>lm :LeaderfMru<cr>
noremap <leader>lf :LeaderfFunction!<cr>
noremap <leader>lb :LeaderfBuffer<cr>
noremap <leader>lt :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}
let g:Lf_NormalMap = {
            \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \ }

"设置echodoc
"关闭默认模式提醒
set noshowmode
let g:echodoc#enable_at_startup = 1

"设置插件vim-preview
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"设置插件CompleteParameter
"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <M-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <M-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <M-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <M-k> <Plug>(complete_parameter#goto_previous_parameter)

"设置javacomplete2插件
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"nmap <M-i> <Plug>(JavaComplete-Imports-AddSmart)
"imap <M-i> <Plug>(JavaComplete-Imports-AddSmart)
"nmap <M-a> <Plug>(JavaComplete-Imports-Add)
"imap <M-a> <Plug>(JavaComplete-Imports-Add)
"nmap <M-m> <Plug>(JavaComplete-Imports-AddMissing)
"imap <M-m> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <M-r> <Plug>(JavaComplete-Imports-RemoveUnused)
"imap <M-r> <Plug>(JavaComplete-Imports-RemoveUnused)
"let g:syntastic_java_checkers = []
"let g:EclimFileTypeValidate = 0
