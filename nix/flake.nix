{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs = { self, nixpkgs, home-manager, llm-agents, ... }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations.development = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ lib, ... }: {
            home.username = "development";
            home.homeDirectory = "/Users/development";
          })
          ./home/development.nix
        ];
        extraSpecialArgs = { inherit llm-agents system; };
      };

      homeConfigurations.admin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ lib, ... }: {
            home.username = "admin";
            home.homeDirectory = "/Users/admin";
          })
          ./home/development.nix
        ];
        extraSpecialArgs = { inherit llm-agents system; };
      };
    };
}
