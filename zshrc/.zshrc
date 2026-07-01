export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$HOME/.pixi/bin:$PATH"

DISABLE_MAGIC_FUNCTIONS=true

autoload -Uz compinit
compinit -C

source_first() {
  emulate -L zsh
  setopt null_glob

  local pattern file
  for pattern in "$@"; do
    for file in ${~pattern}; do
      if [ -r "$file" ]; then
        source "$file"
        return 0
      fi
    done
  done

  return 1
}

source_first \
  "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

source_first \
  "$HOME/.nix-profile/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" \
  "$HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

source_first \
  "$HOME/.nix-profile/share/fzf-tab/fzf-tab.plugin.zsh" \
  "$HOME/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh"

source_first \
  "$HOME/.nix-profile/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh" \
  "$HOME/.nix-profile/share/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" \
  "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

alias vi="nvim"
alias zshconfig="vi ~/.zshrc"
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -la"
alias g="git"
alias cat="bat"
alias catr="bat -pP"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard:' && pwd"
alias tt="gio trash"
alias c="clear"
alias cd="z"
alias ci="zi"
alias lg="lazygit"
alias uvsrc="source .venv/bin/activate"

if (( $+widgets[autosuggest-accept] )); then
  bindkey '^f' autosuggest-accept
fi

if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

if [ -r "$HOME/.fzf.zsh" ]; then
  source "$HOME/.fzf.zsh"
elif command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh 2>/dev/null)"
fi

export VISUAL=nvim
export EDITOR="$VISUAL"

function ros-setup() {
  echo "Setting up ROS Humble environment..."
  source /opt/ros/humble/setup.zsh
  eval "$(register-python-argcomplete3 ros2)"
  eval "$(register-python-argcomplete3 colcon)"
  source "$HOME/Documents/03_Infrastructure/panda_base_ws/install/setup.zsh"
  unfunction ros-setup
}

export ROS_DOMAIN_ID=7

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

preexec() {
  echo -n "\x1b]133;A\x1b\\"
}
