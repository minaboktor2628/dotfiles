ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"

autoload -Uz compinit
compinit

setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# User configuration

export LANG='en_US.UTF-8'
export TZ='America/New_York'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MANPAGER='less'

# Support colors in less
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;32m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_ZN=$'\e[74m'
export LESS_TERMCAP_ZV=$'\e[75m'
export LESS_TERMCAP_ZO=$'\e[73m'
export LESS_TERMCAP_ZW=$'\e[75m'

[ -r "$ZSH_CONFIG_DIR/init.zsh" ] && source "$ZSH_CONFIG_DIR/init.zsh"

# Personal aliases
alias ls="ls -ha --color=auto"
alias la="ls -A --color=auto"
alias lla="ls -lha --color=auto"
alias ll='ls -alF --color=auto'
alias c="clear"
alias vim="nvim"
alias src="source ~/.zshrc"
# Aliases (if applicable)
grep --color=auto < /dev/null &>/dev/null &&
    alias grep='grep --color=auto'
command -v xdg-open &>/dev/null &&
    alias open='xdg-open'

# make a new dir and cd into it
function mkcd(){
  mkdir $1 && cd $1
}

# Copy stdin to the clipboard
function copy() {
	pbcopy 2>/dev/null || xsel 2>/dev/null || clip.exe
}

# run this after "yadm pull"
function sync-ansible(){
  ANSIBLE_NOCOWS=1 ansible-playbook -i "localhost," -c local ~/.config/ansible/local.yml --become -K
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/.local/bin"
