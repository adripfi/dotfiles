{ config, lib, pkgs, username, homeDirectory, hunk, ... }:

{
  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    atuin
    bat
    bun
    curl
    duf
    fd
    fzf
    git
    gnumake
    hunk.packages.${pkgs.stdenv.hostPlatform.system}.hunk
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
    yazi
    zoxide
    zsh
    zsh-autosuggestions
    zsh-fast-syntax-highlighting
    zsh-vi-mode
  ] ++ lib.optionals pkgs.stdenv.isLinux [
    alacritty
    gcc
    glib
    xclip
    xdg-utils
  ];

  programs.home-manager.enable = true;

  home.activation.stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "$HOME/.dotfiles" ]; then
      ${pkgs.stow}/bin/stow --no-folding --dir="$HOME/.dotfiles" --target="$HOME" config tmux zshrc
    fi
  '';
}
