# ========================================
# ~/.bashrc (インタラクティブシェル用)
# ========================================

# 非インタラクティブシェルの場合は何もしない
[[ $- != *i* ]] && return

# bash固有の設定
shopt -s cdspell        # ディレクトリ名の自動修正
shopt -s extglob        # 拡張グロブパターン
shopt -s nocaseglob     # 大文字小文字を区別しない
shopt -s histreedit     # 履歴編集
shopt -s histverify     # 履歴確認
shopt -s dotglob        # 隠しファイルもグロブ対象

# 履歴設定
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

# 便利な関数
mkcd() {
    mkdir -p "$1" && cd "$1"
}

eval "$(starship init bash)"

# 基本エイリアス
alias ll='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# Git エイリアス
alias gpl='git pull'
alias gs='git status'
alias gp='git push'
alias gc='git commit'
alias ga='git add'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline'

# Docker エイリアス
alias dcu='docker compose up'
alias dcud='docker compose up -d'
alias dcd='docker compose down'
alias dcvd='docker compose down -v'
alias dce='docker compose exec'
alias dceb='docker compose exec bash'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'

# 開発用エイリアス
alias nv='nvim'
alias vc='code'
