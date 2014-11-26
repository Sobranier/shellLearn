set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/


" let Vundle manage Vundle
" Bundle 'gmarik/vundle'
"
"my Bundle here:
"
" original repos on github
" Bundle 'kien/ctrlp.vim'
" Bundle 'Shougo/neocomplcache'
" Bundle 'sukima/xmledit'
" Bundle 'sjl/gundo.vim'
" Bundle 'jiangmiao/auto-pairs'
" Bundle 'klen/python-mode'
" Bundle 'emmetio/emmet'
" Bundle 'Valloric/ListToggle'
" Bundle 'SirVer/ultisnips'
" Bundle 'Valloric/YouCompleteMe'
" Bundle 'scrooloose/syntastic'
" Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
" Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
" Bundle 'YankRing.vim'
" Bundle 'vcscommand.vim'
" Bundle 'ShowPairs'
" Bundle 'SudoEdit.vim'
" Bundle 'EasyGrep'
" Bundle 'VOoM'
" Bundle 'VimIM'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""
"neocomplcache
"""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:neocomplcache_enable_at_startup=1
"let g:neoComplcache_disableautocomplete=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-q> <Plug>(neocomplcache_start_unite_quick_match)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
"imap <C-l> <Plug>(neocomplcache_snippets_expand)
"smap <C-l> <Plug>(neocomplcache_snippets_expand)
"imap <C-t> <Plug>(neocomplcache_snippets_jump)
"smap <C-t> <Plug>(neocomplcache_snippets_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete



set mouse=a
set nocompatible
"colorscheme solarized
" colorscheme molokai
"set shortmess=aI
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Let NeoBundle manage NeoBundle
" NeoBundleFetch 'Shougo/neobundle.vim'
" HTML related
" NeoBundle 'sukima/xmledit'
" NeoBundle 'mattn/emmet-vim'
" NeoBundle 'kien/ctrlp.vim'
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
"非兼容模式
set nocp
"底部标尺
set ru
"搜索时高亮显示结果
set hls
set is
"显示行号
set number
"使用:e命令的时候 可选项预览
set wildmenu
"文件默认编码utf-8
set enc=utf-8
"文件默认格式unix
set ff=unix
"缩进为4个空格宽度
set tabstop=4
"设置折叠方式为indent折叠
"set fdm=indent
"自动缩进使用的空格数
set shiftwidth=4
"编辑插入tab时，把tab算作的空格数
set softtabstop=4
"缩进使用空格
set expandtab
"自动缩进
set autoindent
"鼠标捕捉
"set mouse=v
"打开语法高亮
syntax on
"当前行下划线
set cursorline
set fdm=marker
set foldmarker=//{,//}
set cursorcolumn
hi CursorLine cterm=underline 
"取消备份
set nobackup
"配置回删
set backspace=indent,eol,start

set comments=sl:/*,mb:*,ex:*/
"设置字典
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
au BufWritePost *.scss !git sass dirty
"默认配色为darkblue
" color darkbluefix
"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=2

" 重新载入配置
map <leader>s :source ~/.vimrc<CR>

" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv 

"映射F12键为行号的开关
map <F12> :set number!<CR>

nmap <C-L> :tabnext<CR>
nmap <C-H> :tabprevious<CR>

"" 打开php折叠
let php_folding = 1 
"" 打开javascript折叠
let b:javascript_fold=1
" 打开javascript对dom、html和css的支持
let javascript_enable_domhtmlcss=1

let g:xmledit_enable_html=1
au Filetype html let g:xmledit_enable_html=1
au Filetype scss set ft=css
filetype on
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4

nnoremap <leader>t :call OpenInNewTab()<CR>
function! OpenInNewTab()
    let current_line = getline('.')
    if current_line =~ ':\d\+:'
        let info = split(current_line, ' ')
        let items = split(info[0], ':')
        let filename = items[0]
        let linenum = items[1]
        execute "tabe +" . linenum . " " . filename
    else
        let sbcount = 0
        while current_line !~ '/* line \d\+,' && sbcount < 50
            let current_line = getline(line('.')-sbcount)
            let sbcount = sbcount + 1
        endwhile
        let scss_file = split(current_line, ',')
        let linenum = split(scss_file[0], ' line ')[1]
        let item = split(scss_file[1], ' ')[0]
        let item = substitute(item, '\.\./', '', 'g')
        execute "vsp +" . linenum . " %:h/../" . item
    endif
endfunction

" bolow by zhiyelee
" 设置javascriptlint
autocmd FileType javascript set makeprg=jshint\ --config\ /opt/fe/fe.tools/jshint/jshintrc\ %
autocmd FileType javascript set errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m
autocmd FileType javascript inoremap <silent> <F9> <C-O>:lint<CR>
autocmd FileType javascript map <silent> <F9> :lint<CR>


" ======================================
" git blame
" --------------------------------------
" In visual mode, git blame the selection
function! GitBlame() range
" look up function-range-example for more information
    exec '!git blame -L '. line("'<"). ','. line("'>"). ' %'
endfunction
vnoremap <leader>g :call GitBlame()<CR>
" --------------------------------------
" In normal mode, git blame the current line
nnoremap <leader>g :exec '!git blame -L '. line("."). ','. line("."). ' %'<CR>
" ======================================

" by zhiyelee

"初始化pathogen插件
" let pathogen = $HOME . '/.vim/bundle/vim-pathogen/autoload/pathogen.vim'
" execute "source " . pathogen
" call pathogen#infect()

" vim-powerline
set laststatus=2
set background=dark
set t_Co=256
set nocompatible
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
set smartcase

" NeedTree
map <F4> :NERDTreeToggle<CR>

" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

"kangxiaojun"
filetype plugin indent on
" rebase fix
cnorea rebase 2,$s/pick/f/

set fileencodings=utf-8,gbk,cp939,gb18030,big5
set encoding=utf-8
set nobomb
set noswapfile
set mouse=a

" 设置自动补全，用tab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"


