# Zsh Plugin Drop-In Directory

Place repo-managed or copied plugin scripts here.

Recommended layout:

- Single-file plugins: `.config/zsh/plugins/name.zsh`
- Vendored plugin directories: `.config/zsh/plugins/name/name.plugin.zsh`

The shell config auto-sources:

- `.config/zsh/plugins/*.zsh`
- `.config/zsh/plugins/*/*.plugin.zsh`
- `.config/zsh/plugins/*/*.zsh`

Use this directory for plugin scripts you want tracked by `yadm`.

Use `~/.local/share/zsh/plugins` for third-party repos cloned by Ansible,
such as `zsh-autosuggestions` and `zsh-syntax-highlighting`.
