"vimrc{{{
"VimをなるべくVi互換にする
set nocompatible

" vimファイルに関して{と}による折りたたみ設定をする
au FileType vim setlocal foldmethod=marker

" vimrcの新しいタブでの編集と読み込みのショートカット設定
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>

"シンタックス有効
syntax on

" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
filetype plugin indent on

NeoBundle 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleCheck

NeoBundle 'vim-jp/vimdoc-ja'

"encoding
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

"基本設定
set t_vb=
set novisualbell
set number
set ruler
set list
set listchars=tab:>-,trail:-,precedes:<
"set paste

"バックスペースキーでインデント、前行の行末、行頭を削除可能。
set backspace=indent,eol,start

"バックアップファイル、スワップファイルを作らない
set nowritebackup
set nobackup
set noswapfile

"折り返し表示有効かつ折り返し時の自動改行無効
set wrap
set textwidth=0

"カーソル行表示
set cursorline
"set cursorcolumn

"対応カッコ表示、対応括弧に'<'と'>'のペアを追加
set showmatch
set matchpairs& matchpairs+=<:>

" 新しい行を開始したとき (Insertモードで <CR> を打ち込むか、コマンド "o"や "O" を使ったとき)、新しい行のインデントを現在行と同じくする。
set autoindent
"set noautoindent

"インクリサーチ、先頭から検索、検索結果をハイライト、ESC2回でハイライト取り消し
set incsearch
set wrapscan
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

"小文字のみで検索すると大文字小文字無視
set noignorecase
set smartcase

":eでのファイル名補完、大文字小文字無視
set wildmode=longest:full,full
set infercase

"コマンドラインの行数。
set cmdheight=2

" バッファを閉じる代わりに隠す（Undo履歴を残すため）、開く時は既にあるバッファを
set hidden
set switchbuf=useopen

"タブ設定
"expandtab:タブをスペースに置き換え
"tabstep:読み込み時のタブ幅
"tabstop:自動タブ挿入時のタブ幅
"softtabstop:tabキーでのタブ幅
"shiftround: '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set expandtab
set ts=2 sw=2 sts=2
set shiftround

"ステータスライン表示、フォーマット
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P 

"color
set term=xterm
colorscheme test
hi LineNr ctermfg=black ctermbg=white

"}}}

"NeoBundle{{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'h1mesuke/unite-outline'

nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
"nnoremap <silent> [unite]d :VimFiler -split -simple -winwidth=35 -no-quit<CR>

"nnoremap <silent> <Leader>o :<C-u>:Unite -vertical -winwidth=30 outline:!<CR>
nnoremap <silent> <Leader>o :<C-u>:Unite -winheight=15 -no-quit outline:!<CR>

"■インデント可視化
"NeoBundle "nathanaelkane/vim-indent-guides"
"let s:hooks = neobundle#get_hooks("vim-indent-guides")
"function! s:hooks.on_source(bundle)
"  let g:indent_guides_guide_size = 1
"    IndentGuidesEnable
"endfunction

"■単語操作
" 「ds"」："hello world now" -> hello world now
" 「ds(」：(hello world now) -> hello world now
" 「cs"'」："hello world now" -> 'hello world now'
" 「yss"」：hello world now -> "hello world now" worldのoにカーソルがある場合
NeoBundle 'tpope/vim-surround'

"■'p'後,Ctrl-pで古い履歴,Ctrl-nで新しい履歴へと貼りつけたテキスト置換
"NeoBundle 'vim-scripts/YankRing.vim'




NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler.vim'
":VimFiler -split -simple -winwidth=35 -no-quit<CR>
NeoBundle 'JavaScript-syntax'
NeoBundle 'jQuery'
"NeoBundle 'vim-scripts/phpfolding.vim'

"NeoBundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'


"■neocomplcache設定
"辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

"■ neosnippet
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

"}}}

" Mapping{{{
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  - 
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
nmap <space> 20j
nnoremap yw byw

" tTで新規タブでファイルを開く
nnoremap <expr> tT ':<C-u>tabnew ' . GetRelativePath()
function! GetRelativePath()
  let path = expand('%:~:.:h')
  if path == '.'
    return ""
  else
    return path . '/'
  endif
endfunction

nnoremap th :tabn<CR>
nnoremap tl :tabN<CR>


"}}}

