# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
export LANG=ja_JP.UTF-8

case ${OSTYPE} in
    darwin*)
        #ここにMac向けの設定
		export PATH="/usr/local/share/npm/bin:$PATH"
        ;;
    linux*)
        #ここにLinux向けの設定
		unset SSH_ASKPASS
		export PATH="$HOME/.rbenv/bin:$PATH"
		export PATH="/usr/local/heroku/bin:$PATH"
		export PATH="/usr/local/go/bin:$PATH"
		export PATH="/usr/local/hub/bin:$PATH"
		if [ -f "$HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal" ]; then
			eval $(dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal)
		fi
        ;;
esac

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"


if [ -d "$HOME/.rbenv/bin" ]; then
	eval "$(rbenv init -)"
fi

if [ -d "$HOME/.pyenv/bin" ]; then
	eval "$(pyenv init -)"
fi

if [ -d "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
	eval "$(pyenv virtualenv-init -)"
fi

if [ -d "$HOME/.zplug" ]; then
	source $HOME/.zplug/init.zsh
fi




#$PATHの重複排除
typeset -U path PATH

## Default shell configuration
#
# set prompt
#
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
#  PROMPT="%{${fg[white]}%}[%n@%m] %{${fg[white]}%}$%{${reset_color}%} "
  PROMPT="%{${}%}[%n@%m] %{${}%}$%{${reset_color}%} "
  PROMPT2="%B%{${}%}%_$%{${reset_color}%}%b "
  SPROMPT="%B%{${}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${}%}[%/]%{${reset_color}%}"
  ;;
esac

# auto change directory
#
# setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
# setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# no beep sound
#
setopt nobeep

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/dotfiles/.zsh/functions/completions ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

if type vim > /dev/null 2>&1; then
	alias vi="vim"
fi

## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
	  #eval $(dircolors ${HOME}/dotfiles/dircolors-solarized/dircolors.ansi-universal)
	  #export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
		if [ -n "${LS_COLORS}" ]; then
		  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
		fi
    ;;
kterm-color)
    stty erase '^H'
    #export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


#
# Function
# ================================================================

#
# Plugins
# ================================================================
zplug "zplug/zplug"
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
	printf "Install> [y/N]: "
	if read -q; then
    echo; zplug install
	fi
fi

zplug load --verbose
