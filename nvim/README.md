# Neovim 設定

このリポジトリには私の個人的な Neovim 設定ファイルが含まれています。この設定は [lazy.nvim](https://github.com/folke/lazy.nvim) をプラグインマネージャーとして使用し、モジュラー構造で整理されています。

## 構造

- `init.lua` - メインのエントリーポイント（設定の読み込み）
- `lua/config/lazy.lua` - プラグインマネージャーのセットアップ
- `lua/keymaps.lua` - カスタムキーバインド
- `lua/options.lua` - Neovim オプション
- `lua/plugins/` - プラグイン設定

## 機能

- **プラグイン管理**: 効率的なプラグイン読み込みのための lazy.nvim を使用
- **LSP サポート**: 言語サーバー管理のための mason.nvim を設定
- **自動補完**: Copilot 統合付きの nvim-cmp を使用
- **ファイルナビゲーション**: 
  - あいまい検索のための Telescope
  - ファイル管理のための Oil.nvim
- **Git 統合**: Lazygit と Gitsigns を使用
- **UI 強化**: 
  - Tokyo Night カラースキーム
  - より良い構文ハイライトのための Treesitter
  - lualine によるカスタムステータスライン
  - 様々な視覚的改善（hlchunk, scrollbar など）

## キーマッピング

- リーダーキー: `,`
- `<leader>ff` - Telescope でファイル検索
- `<leader>fg` - Telescope でテキスト検索
- `<leader>fb` - バッファ一覧
- `<leader>fh` - ヘルプタグ
- `<leader>o` - Oil ファイルエクスプローラーを開く
- `<leader>y` - クリップボードにコピー
- `<leader>d` - クリップボードにカット
- `gd` - 定義へジャンプ（LSP）
- `K` - ホバー情報を表示（LSP）

## LSP 設定

この設定には Mason を通じた言語サーバーの自動インストールと設定が含まれています。また、言語サーバーがサポートしている場合は保存時の自動フォーマットも設定されています。

## インストール

1. このリポジトリを `~/.config/nvim` ディレクトリにクローンします：
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.config/nvim
   ```

2. Neovim を起動すると、lazy.nvim が自動的に設定されたすべてのプラグインをインストールします。

## カスタマイズ

プラグインを追加または変更するには、`lua/plugins/` ディレクトリ内のファイルを追加または編集します。各プラグインは独自のファイルで設定されており、個々のプラグインを簡単に追加、削除、または変更できます。