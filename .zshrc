export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-interactive-cd
  colored-man-pages
  man
  zsh-autosuggestions
  tmux
  pip
  tldr
  gh
  fzf
  web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG='en_US.UTF-8'
export TZ='America/New_York'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MANPAGER='less'

# Personal aliases
alias ls="ls -ha --color=auto"
alias la="ls -A --color=auto"
alias lla="ls -lha --color=auto"
alias ll='ls -alF --color=auto'
alias c="clear"
alias vim="nvim"
alias src="source ~/.zshrc"

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
