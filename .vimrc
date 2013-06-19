"VimをなるべくVi互換にする
set nocompatible

" vimファイルに関して{と}による折りたたみ設定をする
au FileType vim setlocal foldmethod=marker

""""""""""" NeoBundle設定  """""""""""{{{
" https://github.com/Shougo/neobundle.vim
" インストール
" $ mkdir -p ~/.vim/bundle
" $ export GIT_SSL_NO_VERIFY=true
" $ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" :NeoBundleInstall でプラグインインストール :NeoBundleInstall! で更新
filetype plugin indent off     " required!
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" gitを使ったプラグインマネージャ 基本Vundleと一緒
NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'h1mesuke/unite-outline'
"nnoremap <silent> <Leader>o :<C-u>:Unite -vertical -winwidth=30 outline:!<CR>
nnoremap <silent> <Leader>o :<C-u>:Unite -winheight=15 -no-quit outline:!<CR>
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler.vim'
":VimFiler -split -simple -winwidth=35 -no-quit<CR>

NeoBundle 'JavaScript-syntax'
NeoBundle 'jQuery'
"NeoBundle 'vim-scripts/phpfolding.vim'

"NeoBundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'fancy'

filetype on
filetype indent on
filetype plugin on




"-------------------------------------------------
" neocomplcache設定
"-------------------------------------------------
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

"-------------------------------------------------
" neosnippet
"--------------------------------------------------------------------------
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

"" unite.vim
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]
 
" unite.vim keymap
" https://github.com/alwei/dotfiles/blob/3760650625663f3b08f24bc75762ec843ca7e112/.vimrc
nnoremap [unite]u  :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
"nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
"nnoremap <silent> [unite]d :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" vinarise
let g:vinarise_enable_auto_detect = 1
 
" unite-build map
"nnoremap <silent> ,vb :Unite build<CR>
"nnoremap <silent> ,vcb :Unite build:!<CR>
"nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>


""quickrun
" ウィンドウの高さを指定する場合
"nnoremap <unite>r :QuickRun -outputter/buffer/split ":botright 8sp"
let g:quickrun_config = {}
let g:quickrun_config._={
  \'outputter/buffer/split': ':botright 8sp'
  \} " taught by thinca-san. thx!

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"


"}}}
""""""""""" Vimの基本的な設定  """""""""""{{{

"インサートモードを抜けたらIMEの日本語入力を自動的にOFFにする
"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

"行数表示
set number

" コピー＆ペーストモード
" set paste

"バックスペースキーの動作を決定する
"2:indent,eol,startと同じ
set backspace=2

"新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set autoindent

"検索で小文字なら大文字を無視、大文字なら無視しない設定
set smartcase

"(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set nowrapscan

"インクリメンタルサーチを行う
set incsearch

"highlight matches with last search pattern
set hlsearch

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"保存しないで他のファイルを表示することが出来るようにする
set hidden

"カレントバッファ内のファイルの文字エンコーディングを設定する
set fileencoding=utf-8

" タブを2スペースに置き換える
set expandtab
set ts=2

"ファイル内の <Tab> が対応する空白の数
set tabstop=2

"自動インデントの各段階に使われる空白の数
set shiftwidth=2

"強調表示(色付け)のON/OFF設定
syntax on

" カラースキーマ設定 (~/.vim/colors/wombat.vimなどが必要)
"colorscheme wombat

"ステータスラインを表示するウィンドウを設定する
"2:常にステータスラインを表示する
set laststatus=2

"ステータス行の表示内容を設定する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}G8%=%l,%c%V%8P

"vimのバックアップファイルとスワップファイル
set nobackup
set noswapfile

"自動改行オフ
set tw=0

" マウスモード有効
set mouse=a

" xtermとscreen対応
set ttymouse=xterm2

"UTF-8文字化け対応
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932

"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"}}}
""""""""""" 効率化UPのための設定 """""""""""{{{
" ディフォルトのtのマッピングを消す
nnoremap t <Nop>

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

" tDでタブを閉じる
nnoremap <silent> td :<C-u>tabclose<CR>

" <Leader>を\にリマッップ
nnoremap \ <Leader>
vnoremap \ <Leader>

" バッファ移動
nnoremap <C-n> :bn<cr>


"コメントアウトが連続して入力されるのを禁止 :a!でも代用可
autocmd FileType * setlocal formatoptions-=ro

"全角スペースを　で表示
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
au BufRead,BufNew * match JpSpace /　/

"タブを見えるように設定
set list
set listchars=tab:>-,trail:-

" サーチハイライトををESC二回で消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" 挿入モードとノーマルモードでステータスラインの色を変更する
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=Black guibg=White gui=none ctermfg=Black ctermbg=White cterm=none

" ヴィジュアルモードで選択したテキストをnで検索する(レジスタv使用)
"vnoremap <silent> n "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" gfでカーソル下のファイル名を新しいタブで開く
nnoremap gf :tabe <cfile><CR>
vnoremap gf :tabe <cfile><CR>

" 検索語が画面中央にくるように
"nmap n nzz
"nmap N Nzz

" Ctrl + Shift + u で選択した単語を現在のファイル内でgrep (レジスタu使用)
"vnoremap <silent> <C-S-u> "uy:vimgrep /<C-r>u/ <C-r>%<CR>:copen<CR>gv=gv

" ヤンク、切り取り時にレジスタ"の値をzにもコピーしておく(連続貼付可に使う)
"vnoremap <silent> y y:let @z=@"<CR>
"vnoremap <silent> d d:let @z=@"<CR>

" ビジュアルモードで選択したテキストを消してレジスタzの内容を貼付ける(連続貼付可)
"vnoremap <silent> p x"zP

" vimrcの新しいタブでの編集と読み込みのショートカット設定
nnoremap ;s :source $MYVIMRC<CR>
nnoremap ;v :tabe $MYVIMRC<CR>
nnoremap ;g :tabe $MYGVIMRC<CR>
nnoremap ;l :tabe ~/.vimrc.local<CR>


"nmap <C-G> :vimgrep /\<<C-R><C-W>\>/ **/*.cpp
" :makeや:grepをした際に自動的にquickfixが開くようにする
"autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd if len(getqflist()) != 0 | cw | endif
autocmd QuickFixCmdPost *grep* cwindow

" テキストファイル専用の設定
augroup ettext
  autocmd!
  autocmd BufRead,BufNewFile *.txt setlocal expandtab nolist tw=0
augroup END

" ファイルを開いたときに前回の編集箇所に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif


"}}}
""""""""""" ローカルの設定があれば読み込 み """"""""""""{{{
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
"}}}
