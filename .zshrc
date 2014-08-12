#
# Env
# ================================================================
export LANG=ja_JP.UTF-8
fpath=($HOME/.zsh/functions $fpath)
# History
# ================================================================
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups

# ヒストリを共有
setopt share_history

# 補完機能
# ================================================================
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
autoload -U compinit
compinit

# Set prompt
# ================================================================
autoload colors
colors
case ${UID} in
0)
  PROMPT="[%{${fg[red]}%}%n@%m%{${reset_color}%}] %{${fg[red]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[red]}%}[%/]%{${reset_color}%}"
  ;;
*)
  PROMPT="%{${fg[red]}%}[%n@%m] %{${fg[red]}%}$%{${reset_color}%} "
  PROMPT2="%B%{${fg[red]}%}%_$%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[red]}%}[%/]%{${reset_color}%}"
  ;;
esac

# Set title
# ================================================================
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# 色を使う
setopt prompt_subst

# 補完候補Color
#eval `dircolors`
export LSCOLORS=HxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## 補完候補のカーソル選択を有効
zstyle ':completion:*:default' menu select=1

# 補完候補を詰めて表示
setopt list_packed

# ビープを鳴らさない
setopt nobeep

# ディレクトリ名で cd
setopt auto_cd

# cd 時に自動で push
setopt autopushd

# 同じディレクトリを pushd しない
setopt pushd_ignore_dups

# スペルチェック
setopt correct

## 出力時8ビットを通す
setopt print_eight_bit

# Path
# ================================================================
# homebrew brew doctor error回避
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH

# MySQL
export PATH=$PATH:/usr/local/mysql/bin

# History
# ================================================================

# 重複履歴を無視
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Alias
# ================================================================
alias showdot="defaults write com.apple.finder AppleShowAllFiles true"
alias hidedot="defaults write com.apple.finder AppleShowAllFiles false"
alias showlib="chflags nohidden ~/Library"
alias hidelib="chflags nohidden ~/Library"

#alias open='open .'
alias la='ls -a'
alias lf="ls -F"
alias ll='ls -ltr'
alias du="du -h"
alias df="df -h"
alias cl='clear'

alias vi='vim'


#
# Function
# ================================================================

#=============================
# source auto-fu.zsh
#=============================
if [ -f ~/.zsh/auto-fu.zsh ]; then
source ~/.zsh/auto-fu.zsh
function zle-line-init () {
auto-fu-init
}
zle -N zle-line-init
zstyle ':completion:*' completer _oldlist _complete
zstyle ':auto-fu:var' postdisplay $''
fi
