{
  description = "Personal dotfiles bootstrap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHome = { system, username, homeDirectory }:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit username homeDirectory;
          };
          modules = [ ./home.nix ];
        };
    in {
      homeConfigurations = {
        apfisterer = mkHome {
          system = "x86_64-linux";
          username = "apfisterer";
          homeDirectory = "/home/apfisterer";
        };

        adrian = mkHome {
          system = "x86_64-linux";
          username = "adrian";
          homeDirectory = "/home/adrian";
        };

        adrian-mac = mkHome {
          system = "aarch64-darwin";
          username = "adrian";
          homeDirectory = "/Users/adrian";
        };
      };
    };
}
