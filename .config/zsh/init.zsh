autoload -U colors && colors
setopt PROMPT_SUBST

for fzf_script in \
  /usr/share/doc/fzf/examples/completion.zsh \
  /usr/share/fzf/completion.zsh \
  "$HOME/.fzf/shell/completion.zsh"
do
  [ -r "$fzf_script" ] && source "$fzf_script" && break
done

for fzf_script in \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/fzf/key-bindings.zsh \
  "$HOME/.fzf/shell/key-bindings.zsh"
do
  [ -r "$fzf_script" ] && source "$fzf_script" && break
done

[ -r "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
  source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"

if [ -d "$ZSH_CONFIG_DIR/plugins" ]; then
  plugin_files=(
    "$ZSH_CONFIG_DIR"/plugins/*.zsh(N)
    "$ZSH_CONFIG_DIR"/plugins/*/*.plugin.zsh(N)
    "$ZSH_CONFIG_DIR"/plugins/*/*.zsh(N)
  )

  for plugin_file in "${plugin_files[@]}"; do
    [ -r "$plugin_file" ] || continue
    source "$plugin_file"
  done
fi

[ -r "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
  source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

git_prompt_info() {
  local ref dirty

  ref=$(command git symbolic-ref --quiet --short HEAD 2>/dev/null) || \
    ref=$(command git rev-parse --short HEAD 2>/dev/null) || return

  if ! command git diff --quiet --ignore-submodules --cached 2>/dev/null || \
     ! command git diff --quiet --ignore-submodules 2>/dev/null; then
    dirty="%{$fg[yellow]%}%1{✗%}"
  fi

  echo "%{$fg_bold[blue]%}git:(%{$fg[red]%}${ref}%{$fg[blue]%})${dirty}"
}

PROMPT='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info) '
