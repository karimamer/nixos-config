{
  description = "Darwin System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, darwin, nixpkgs, home-manager, nix-homebrew,
              homebrew-bundle, homebrew-core, homebrew-cask, catppuccin, ... }:
    let
      user = "karim";
      system = "aarch64-darwin";

      mkApp = scriptName: {
        type = "app";
        program = toString (nixpkgs.legacyPackages.${system}.writeScript "app-${scriptName}" ''
          #!/usr/bin/env bash
          PATH=${nixpkgs.legacyPackages.${system}.git}/bin:$PATH
          exec darwin-rebuild ${scriptName} --flake .#default
        '');
      };
    in {
      darwinConfigurations.default = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          home-manager.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user} = {
                imports = [
                  catppuccin.homeManagerModules.catppuccin
                ];
                nixpkgs.config.allowUnfree = true;
              };
            };
            nixpkgs.config.allowUnfree = true;
            nix-homebrew = {
              enable = true;
              user = user;
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
                "homebrew/homebrew-bundle" = homebrew-bundle;
              };
              mutableTaps = false;
              autoMigrate = true;
              enableRosetta = true;
            };
          }
          ./hosts/darwin
        ];
      };

      # Apps for common commands
      apps.${system} = {
        build = mkApp "build";
        build-switch = mkApp "switch";
        check = mkApp "check";
      };

      # Devshell for development environment
      devShells.${system}.default = let
        pkgs = nixpkgs.legacyPackages.${system};
      in pkgs.mkShell {
        nativeBuildInputs = with pkgs; [ bashInteractive git ];
        shellHook = ''
          export EDITOR=vim
        '';
      };
    };
}
