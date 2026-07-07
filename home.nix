{ config, lib, pkgs, username, homeDirectory, ... }:

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
    glow
    git
    gnumake
    lazygit
    lsd
    neovim
    nodejs_22
    ripgrep
    starship
    stow
    tmux
    trash-cli
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

  programs.git = {
    enable = true;
    settings = {
      core.pager = "delta";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
    };
  };

  home.activation.stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "$HOME/.dotfiles" ]; then
      ${pkgs.stow}/bin/stow --no-folding --dir="$HOME/.dotfiles" --target="$HOME" config tmux zshrc
    fi
  '';
}
