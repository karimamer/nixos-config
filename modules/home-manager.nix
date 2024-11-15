{ config, pkgs, lib, home-manager, ... }:

let
  user = "karim";
  name = "karim amer";
  email = "karim.amer.sa@gmail.com";
in
{
  imports = [
    ./dock
    ./bat.nix
    ./git.nix
    ./ssh.nix
    ./zsh.nix
    ./pass.nix
    ./yazi.nix
    ./zoxide.nix
    ./fzf.nix
    ./eza.nix
    ./alacritty.nix
  ];

  # User configuration
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  # Homebrew configuration
  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
  };

  # Home-manager configuration
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        stateVersion = "23.11";
      };

      programs = {
        # ZSH Configuration

        # Git Configuration

        # Vim Configuration

        # Alacritty Configuration

        # SSH Configuration

      };
      manual.manpages.enable = false;
    };
  };

  # Dock configuration
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/System/Applications/Messages.app/"; }
    { path = "/System/Applications/Facetime.app/"; }
    { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
    { path = "/System/Applications/Music.app/"; }
    { path = "/System/Applications/News.app/"; }
    { path = "/System/Applications/Photos.app/"; }
    { path = "/System/Applications/Photo Booth.app/"; }
    { path = "/System/Applications/TV.app/"; }
    { path = "/System/Applications/Home.app/"; }
    {
      path = "${config.users.users.${user}.home}/.local/share/";
      section = "others";
      options = "--sort name --view grid --display folder";
    }
    {
      path = "${config.users.users.${user}.home}/.local/share/downloads";
      section = "others";
      options = "--sort name --view grid --display stack";
    }
  ];

  # System configuration
  system.stateVersion = 4;
}
