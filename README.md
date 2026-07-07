# Dotfiles

This repo uses Nix Home Manager for portable CLI packages and GNU Stow for
config symlinks. Home Manager installs the tools; Stow links the dotfiles into
`$HOME`.

On macOS, keep Homebrew for GUI apps, casks, fonts, and macOS-specific tools.
Use Home Manager for the shared shell/dev CLI baseline.

## Manual Prerequisites

- Install Nix from https://nixos.org/download/.
- Enable flakes:

```bash
mkdir -p ~/.config/nix && printf 'experimental-features = nix-command flakes\n' > ~/.config/nix/nix.conf
```

- Install `JetBrainsMono Nerd Font` and select it in the terminal.
- Set the login shell to `zsh` if the machine does not already use it.
- On macOS, install Homebrew for casks, fonts, and native apps.
- Optional: install machine-specific tools that are not part of this baseline,
  such as ROS, Pixi, Opencode, or project SDKs.

## Setup

```bash
git clone git@github.com:adripfi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
nix run github:nix-community/home-manager -- switch --flake .#apfisterer
```

On Mac:

```bash
cd ~/.dotfiles
nix run github:nix-community/home-manager -- switch --flake .#adrian-mac
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

On Mac:

```bash
home-manager switch --flake .#adrian-mac
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
