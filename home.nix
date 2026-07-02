{ config, lib, pkgs, ... }:

{
  home.username = "apfisterer";
  home.homeDirectory = "/home/apfisterer";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    alacritty
    atuin
    bat
    bun
    curl
    duf
    fd
    fzf
    gcc
    git
    glib
    gnumake
    lazygit
    lsd
    neovim
    nodejs_22
    ripgrep
    starship
    stow
    tmux
    unzip
    wget
    xclip
    xdg-utils
    yazi
    zoxide
    zsh
    zsh-autosuggestions
    zsh-fast-syntax-highlighting
    zsh-vi-mode
  ];

  programs.home-manager.enable = true;

  home.activation.stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "$HOME/.dotfiles" ]; then
      ${pkgs.stow}/bin/stow --no-folding --dir="$HOME/.dotfiles" --target="$HOME" config tmux zshrc
    fi
  '';
}
