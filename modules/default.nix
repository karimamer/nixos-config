{ config, pkgs, ... }:
let
  modules = [
    ./bat.nix
    ./git.nix
    ./ssh.nix
    ./pkgs.nix
    ./yazi.nix
    ./zoxide.nix
    ./fastfetch.nix
    ./fzf.nix
    ./nix.nix
    ./eza.nix
    ./zsh.nix
    ./starship.nix
    ./wezterm.nix
    ./alacritty.nix
  ];
in
{
  imports = modules;
  programs.zsh.enable = true;
  xdg.dataHome = "${config.home.homeDirectory}/.local/share";
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";


  # System Configuration for macOS Applications
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.home.packages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
      # Set up applications.
      echo "setting up /Applications..." >&2
      rm -rf /Applications/Nix\ Apps
      mkdir -p /Applications/Nix\ Apps
      find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
      while read -r src; do
        app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
      done
    '';
}
