{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations."connor" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [{
            home.username = "development";
            home.homeDirectory = "/Users/development";
            home.stateVersion = "24.05";

            programs.home-manager.enable = true;

            home.packages = with pkgs; [
              git
              ripgrep
              fish
            ];

            programs.fish.enable = true;
          }];
        };
    };
}
