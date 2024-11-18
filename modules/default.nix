{ config, pkgs, ... }:
let
  modules = [
    ./bat.nix
    ./git.nix
    ./ssh.nix
    ./pkgs.nix
    ./yazi.nix
    ./zoxide.nix
    ./starship.nix
    ./fastfetch.nix
    ./direnv.nix
    ./fzf.nix
    ./nix.nix
    ./eza.nix
  ];
in
{
  imports = modules;
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
  };
  home.stateVersion = "24.05";
}
