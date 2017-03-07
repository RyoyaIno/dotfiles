"Control+jでescape
inoremap <C-j> <esc>
vnoremap <C-j> <esc>

" 保存時に:w!!でsudo権限で無理やり保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

"##### 基本設定 #####
set nocompatible
set number " 行番号表示
set title " ターミナルのタイトルセット
set showmatch " かっこの一致を強調
set hidden " ファイル保存なしで別ファイルを開ける
set autoread "内容が変更されたら自動的に再読込
set clipboard=unnamed,autoselect
syntax on "コードの色分け

"##### 可視化 #####
set list
set listchars=tab:>_,trail:_,eol:↲,extends:>,precedes:<

"##### 文字コード #####
set encoding=utf-8 "文字コード設定
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8 "自動文字コード識別

"##### インデント #####
set shiftwidth=2 "インデントする文字数
set tabstop=2 " タブ幅
set expandtab " タブをスペース化
set autoindent " 改行時オートインデント
set smartindent " カッコに対するオートインデント
set shiftwidth=2 "インデントする文字数
"拡張子ごとに上書き
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.\(php\|java\|c\|cc\|cpp\|h\|groovy\) setlocal tabstop=4 shiftwidth=4 

"##### カーソル #####
set whichwrap=h,l,b,s,<,>,[,] " 行頭行末のカーソル移動
set virtualedit=block " 文字のないところにカーソル移動
set backspace=indent,eol,start " バックスペースをどこでも使えるように

"##### バックアップ #####
set noswapfile "swpファイルを生成しない
set nobackup "バックアップを取らない

"##### 検索 #####
set incsearch "インクリメンタルサーチを有効に
set hlsearch "検索結果をハイライト

"##### マウス #####
if has ("mouse")
  set mouse=a "マウスを使用可能に
  set guioptions+=a
  set ttymouse=xterm2
endif

"##### ステータスバー#####
set showcmd "ステータスラインにコマンド表示
set laststatus=2 "ステータスラインを常に表示
set statusline+=%<%F "ファイル名表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}] "文字コード表示
set statusline+=%r "読込専用かどうか表示
set statusline+=%= "以下ツールバー右側
set statusline+=[Row:%l/%L] "現在文字行/全体列表行
set statusline+=[Col:%c/%{col('$')-1}] "現在文字列/全体列表示

"##### ペースト時オートインデント無効化 #####
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif

