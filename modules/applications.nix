{ config, pkgs, ... }:
{
  imports = [
    ./system.nix
  ];

  # Basic Darwin system configuration
  system.defaults.dock.autohide = true;
  system.defaults.NSGlobalDomain.AppleKeyboardUIMode = 3;
  system.stateVersion = 4;
}

# modules/darwin/system.nix
{ config, pkgs, username, ... }:
{
  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.home-manager.users.${username}.home.packages;
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
