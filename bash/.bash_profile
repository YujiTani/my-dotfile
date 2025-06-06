
# ========================================
# ~/.bash_profile (ログインシェル用)
# ========================================
#!/bin/bash

# PATH設定（環境変数）
# システムデフォルトPATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# 開発ツールPATH
export PATH="/usr/local/opt/mysql/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# npm関連（重複を整理）
export PATH="$HOME/.npm-global/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Node.js関連環境変数
export NODE_OPTIONS=--no-node-snapshot

# NVM設定
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# エディタ設定
export EDITOR=nvim
export VISUAL=nvim

# 言語設定
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

# .bashrcが存在する場合は読み込む
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

