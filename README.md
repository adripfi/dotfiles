# macOS Setup

## Prerequisites

These tools need to be installed before cloning the dotfiles:

### Core Shell Tools
- zsh
- brew: https://brew.sh/
- stow: `brew install stow`
- xclip: `brew install xclip`
- gio: `brew install gio`

### Shell Enhancement
- Oh-my-zsh: https://ohmyz.sh/
  - Required plugins (all installed via single commands):
  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/powerlevel10k
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
  git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-256color
  ```

### Terminal & Fonts
- JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads
- Kitty: https://sw.kovidgoyal.net/kitty/binary/

### Development Tools
- Neovim: `brew install neovim`
- Yazi: https://yazi-rs.github.io/docs/installation#homebrew
- eza (replaces exa): `brew install eza`
- lazygit: `brew install lazygit`
- bat: `brew install bat`
- zoxide: https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation
- fzf: `brew install fzf`

## Installation

1. Clone this repo into your home folder:
```bash
cd ~ && git clone git@github.com:adripfi/dotfiles.git
```

2. Rename the directory:
```bash
mv ~/dotfiles ~/.dotfiles
```

3. Link configurations using stow:
```bash
stow config p10k zshrc
```

## Shell Features

The shell configuration includes:
- Powerlevel10k theme with instant prompt
- Vi mode with custom keybindings
- Syntax highlighting and autosuggestions
- Custom aliases for improved workflow
- Integration between zsh-vi-mode and fzf
- Yazi integration with automatic directory change
- Custom keybindings (CTRL+f for autosuggest-accept)

## Additional Tools

### CLI Tools
- fzf (fuzzy finder)
- karabiner (see .json configs in `karabiner/`)
- Mamba: https://github.com/conda-forge/miniforge


### GUI Applications
- Rectangle (Window management): https://github.com/rxhanson/Rectangle
- Karabiner (Keyboard customization)


