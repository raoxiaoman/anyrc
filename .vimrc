" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'dyng/ctrlsf.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
"Plug 'fholgado/minibufexpl.vim'
Plug 'mhinz/vim-signify'
"Plug 'tpope/vim-commentary'
Plug 'rdnetto/YCM-Generator'
Plug 'derekwyatt/vim-protodef'
Plug 'derekwyatt/vim-fswitch'
Plug 'aceofall/gtags.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-protodef'
Plug 'derekwyatt/vim-fswitch'
Plug 'godlygeek/tabular'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
" Initialize plugin system
call plug#end()

" 设主题颜色为dracula
set backspace=2
syntax on
set t_Co=256
set background=dark
colorscheme dracula
hi Normal ctermfg=white ctermbg=black

" 设置主题颜色为molokai
"let g:rehash256 = 1
"colorscheme molokai

" 设置leader键
let mapleader=","

" 设置背景在黑色和透明间切换
map <leader>bn :hi Normal ctermfg=white ctermbg=none<CR>
map <leader>nb :hi Normal ctermfg=white ctermbg=black<CR>

"设置行号
set number

"让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" ESC不方便
"imap <C-I> <Esc>
inoremap fd <Esc>
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]

" 设置YCM
" YCM 补全菜单配色
"选中项
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
highlight Pmenu ctermfg=3 ctermbg=0  guifg=#005f87 guibg=#EEE8D5
let g:ycm_global_ycm_extra_conf = '/home/raohui/.ycm_extra_conf.py'
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项"
nnoremap <C-b> :YcmCompleter GoToDefinitionElseDeclaration <CR>
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
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


"" 设置NERDTReeToggle快捷键
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

" buffer 切换快捷键
map <F3> :MBEbn<cr>
map <F2> :MBEbp<cr>


" 使用 ctrlsf.vim
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in
" project
let g:ctrlsf_ackprg = 'ag'
nnoremap <C-f> :CtrlSF


"gtags.vim 设置项
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope


"设置格式化autofarmat
noremap <F4> :Autoformat<CR>
let g:autoformat_verbosemode=1

"设置vim_airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <F2> :bn<CR>
nnoremap <F3> :bp<CR>

" 设置CtrlP快捷键
map <C-p> :CtrlP<CR>
" CtrlP和ag搭配
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
endif

" 设置tagbar的信息
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_right=1
" 设置显示／隐藏标签列表子窗口的快捷键。
nnoremap <F5> :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1

" 设置设置multi_cursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'

" 由借口快速生成实现框架配置
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
map <C-w> :w<CR>
imap <C-w> <C-o>:w<CR>

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


