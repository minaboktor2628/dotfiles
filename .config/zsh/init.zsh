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
  for plugin_file in \
    "$ZSH_CONFIG_DIR"/plugins/*.zsh \
    "$ZSH_CONFIG_DIR"/plugins/*/*.plugin.zsh \
    "$ZSH_CONFIG_DIR"/plugins/*/*.zsh
  do
    [ -r "$plugin_file" ] || continue
    source "$plugin_file"
  done
fi

[ -r "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
  source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
