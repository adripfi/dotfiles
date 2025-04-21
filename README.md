# macOS Setup

## Prerequisites

Need to be installed before cloning dotfiles 
- zsh: 
- brew: https://brew.sh/
- Oh-my-zsh: https://ohmyz.sh/
	- Plugins:
	```bash
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions.git \
	  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
	  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/powerlevel10k
	git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
	  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
	git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
	( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )
	```
- stow: `brew install stow`
- Neovim: `brew install neovim`
- Yazi: https://github.com/sxyazi/yazi
- JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads
- Kitty: https://sw.kovidgoyal.net/kitty/binary/
- yazi https://yazi-rs.github.io/docs/installation#homebrew
- powerlevel10k: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh (don't set it up!)
- eza (replaces exa): `brew install eza`
- lazygit: `brew install lazygit`
- batcat `brew install bat`
- zoxide: https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file#installation 
## Installation

Clone this repo into your home folder:
```bash
cd ~ && git clone git@github.com:adripfi/dotfiles.git
```
Rename:
```bash
mv ~/dotfiles ~/.dotfiles
```
Link stow 
```bash
stow .
```


## More CLI tools that don't need config and should be installed after this setup
- fzf
- karabiner see .json configs in `karabiner/`
- Mamba: https://github.com/conda-forge/miniforge
## More Important Apps

- Rectangle (Window management): https://github.com/rxhanson/Rectangle
- Karabiner: 

