-- TypeScript/JavaScript Language Server設定
-- tsserver（TypeScript Language Server）の設定
return {
  -- TypeScript Language Serverのコマンド
  cmd = { 'typescript-language-server', '--stdio' },
  
  -- サポートするファイルタイプ
  filetypes = { 
    'javascript', 
    'javascriptreact', 
    'typescript', 
    'typescriptreact' 
  },
  
  -- プロジェクトルートを検出するためのマーカーファイル
  root_markers = { 
    'package.json', 
    'tsconfig.json', 
    'jsconfig.json', 
    '.git' 
  },
  
  -- 単一ファイルでもLSPを有効にする
  single_file_support = true,
  
  -- TypeScript Language Serverの設定
  settings = {
    typescript = {
      -- インライン補完を有効にする
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      -- 未使用の変数やインポートを報告
      reportUnusedVariables = true,
      reportUnusedParameters = true,
      -- 自動インポートの設定
      preferences = {
        importModuleSpecifier = 'relative',
        includePackageJsonAutoImports = 'auto',
      },
    },
    javascript = {
      -- JavaScriptでも同様の設定を適用
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      preferences = {
        importModuleSpecifier = 'relative',
        includePackageJsonAutoImports = 'auto',
      },
    },
  },
}