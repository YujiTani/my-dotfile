# Neovim Configuration

開発作業用に最適化されたNeovim設定です。mini.nvimを使用したモダンで軽量な構成となっています。

## 動作環境

- **Neovim**: 0.10.0 以上
- **OS**: macOS (Darwin 23.6.0 で動作確認済み)
- **Git**: プロジェクト管理とプラグイン取得に必要
- **Node.js**: GitHub Copilot使用時に必要

## 基本操作

### リーダーキー
- リーダーキー: `,` (カンマ)

### 基本的なキーマップ

#### ファイル操作
- `,f` - ファイル検索（Git追跡ファイル対象）
- `,b` - バッファ選択・削除
- `,h` - 訪問履歴表示
- `:Files` - ファイルエクスプローラー開く

#### ナビゲーション
- `p`/`P` - ペースト後にカーソルを末尾に移動
- `<Space>q` - タブまたはウィンドウを閉じる
- `<Esc>` - 検索ハイライトをクリア

#### セッション管理
- `:SessionWrite [名前]` - セッションを保存
- `:SessionLoad` - セッションを読み込み
- `:SessionDelete` - セッションを削除
- `:SessionEscape` - 現在のセッションから離脱
- `:SessionReveal` - 現在のセッション名を表示

#### 設定ファイルクイックアクセス
- `:InitLua` - init.luaを開く
- `:Keymapconf` - keymaps.luaを開く
- `:Hooksconf` - hooks.luaを開く
- `:Optionsconf` - options.luaを開く

#### 補完機能
- `<Tab>` - 次の候補選択
- `<Shift-Tab>` - 前の候補選択
- `<Enter>` - 候補確定

#### GitHub Copilot
- `<Tab>` - 提案を受け入れ
- `<Shift-Tab>` - 単語単位で受け入れ
- `<Ctrl-j>` - 行単位で受け入れ
- `<Ctrl-n>`/`<Ctrl-p>` - 次/前の提案
- `<Esc>` - 提案を非表示

## プラグイン・拡張機能

### コアプラグイン
- **mini.nvim** - 軽量で統合されたプラグインスイート
- **nvim-lspconfig** - LSP設定管理
- **nvim-treesitter** - シンタックスハイライトとコード解析

### mini.nvimモジュール

#### 基本機能
- **mini.basics** - 基本設定とキーマッピング
- **mini.icons** - アイコン表示
- **mini.statusline** - ステータスライン
- **mini.tabline** - タブライン

#### エディター機能
- **mini.completion** - 自動補完
- **mini.snippets** - スニペット機能
- **mini.pairs** - 自動括弧補完
- **mini.surround** - 括弧変換・編集

#### ファイル管理
- **mini.files** - ファイルエクスプローラー
- **mini.pick** - Fuzzy Finder
- **mini.bufremove** - バッファ削除機能

#### セッション管理
- **mini.sessions** - セッション保存・復元
- **mini.starter** - スタートメニュー
- **mini.visits** - 訪問履歴

#### 視認性向上
- **mini.cursorword** - カーソル下の単語ハイライト
- **mini.indentscope** - インデントスコープ表示
- **mini.trailspace** - 末尾空白表示
- **mini.diff** - Git差分表示

#### その他
- **mini.notify** - 通知システム
- **mini.misc** - カーソル位置復元など
- **mini.jump** - f/tキー移動強化
- **mini.clue** - キーマップヒント表示
- **mini.fuzzy** - あいまい検索エンジン

### 外部プラグイン
- **vim-jp/vimdoc-ja** - ヘルプの日本語化
- **zbirenbaum/copilot.lua** - GitHub Copilot AI補完

## LSP設定

### 設定済みLSP
- **lua_ls** - Lua言語サーバー（Neovim設定用に最適化）

### LSP機能
- 自動補完
- エラー診断
- 定義ジャンプ
- シンボル検索

## テーマ・外観

- **カラースキーム**: minicyan
- **行番号**: 表示
- **カーソルライン/列**: ハイライト表示
- **対応括弧**: ハイライト表示
- **24bit色**: 対応
- **不可視文字**: タブ(→)、スペース(·)、末尾空白(×)で表示

## 編集設定

### インデント・タブ
- **タブ幅**: 2スペース
- **インデント幅**: 2スペース
- **タブをスペースに展開**: 有効
- **自動インデント**: 有効

### 検索・表示
- **検索結果ハイライト**: 有効
- **行の折り返し**: 有効（単語境界で改行）
- **スクロールオフセット**: 縦8行、横8列
- **クリップボード**: システムクリップボードと連携

### ファイル操作
- **自動保存**: 有効
- **自動読み込み**: 有効（ファイル変更時）
- **ディレクトリ自動作成**: 保存時に存在しないディレクトリを自動作成

## インストール方法

1. 設定ディレクトリに配置:
   ```bash
   git clone <このリポジトリ> ~/.config/nvim
   ```

2. Neovimを起動:
   ```bash
   nvim
   ```

3. 初回起動時にmini.nvimが自動インストールされます

4. Tree-sitterパーサーの更新（必要に応じて）:
   ```
   :TSUpdate
   ```

## トラブルシューティング

### よくある問題
- **LSPエラー**: `:checkhealth lsp`でLSPの状態を確認
- **Tree-sitterエラー**: `:TSUpdate`でパーサーを更新
- **Copilotが動作しない**: Node.jsがインストールされているか確認

### ログの確認
- `:messages` - Neovimのメッセージ履歴
- `:checkhealth` - 全体的な健康状態チェック

## カスタマイズ

設定ファイルは以下の構造で管理されています:

```
nvim2/
├── init.lua                 # メイン設定ファイル
├── lua/
│   ├── keymaps.lua         # キーマップ設定
│   ├── options.lua         # エディター設定
│   ├── theme.lua           # テーマ設定
│   ├── hooks.lua           # オートコマンド・フック
│   ├── mini/
│   │   └── mini.lua        # mini.nvim初期化
│   └── lsp/
│       └── init.lua        # LSP設定管理
└── after/
    └── lsp/
        └── lua_ls.lua      # Lua LSP個別設定
```

各ファイルを編集して、設定をカスタマイズできます。

性能チェックに、vim-startuptime を使うと起動速度測定ができます
```
# install
go install github.com/rhysd/vim-startuptime@latest
# 実行
vim-startuptime -vimpath nvim
```
