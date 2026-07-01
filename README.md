# Dotfiles

This repo uses Nix Home Manager for packages and GNU Stow for config symlinks.
Home Manager installs the tools; Stow links the dotfiles into `$HOME`.

## Manual Prerequisites

- Install Nix with flakes enabled.
- Install `JetBrainsMono Nerd Font` and select it in the terminal.
- Set the login shell to `zsh` if the machine does not already use it.
- Optional: install machine-specific tools that are not part of this baseline,
  such as ROS, Pixi, Opencode, or project SDKs.
- Optional: install Hunk for the LazyGit pager:

```bash
npm install -g hunkdiff
```

## Setup

```bash
git clone git@github.com:adripfi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
nix run github:nix-community/home-manager -- switch --flake .#apfisterer
```

The Home Manager activation links the stow packages automatically:

```bash
stow --no-folding --dir="$HOME/.dotfiles" --target="$HOME" config tmux zshrc
```

Install Yazi packages from `package.toml`:

```bash
ya pkg install
```

Restore Neovim plugins from the LazyVim lock file:

```bash
nvim --headless '+Lazy! restore' +qa
```

## Updating

```bash
cd ~/.dotfiles
nix flake update
home-manager switch --flake .#apfisterer
```

Yazi packages:

```bash
ya pkg upgrade
```

Neovim plugins:

```vim
:Lazy update
```

Commit these files when updates are intentional:

- `flake.lock`
- `config/.config/nvim/lazy-lock.json`
- `config/.config/nvim/lazyvim.json`
- `config/.config/yazi/package.toml`

## Repo Policy

Track hand-written config, LazyVim lock files, and `yazi/package.toml`.

Do not track installed Yazi plugin directories, Ruff caches, `.DS_Store`, backup
files, logs, or Alacritty theme preview images.
