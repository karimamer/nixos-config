{ config, lib, pkgs, ... }:
let
  user = config.home.username;
in
{
  programs.ssh = {
    enable = true;
    includes = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin [
        "/Users/${user}/.ssh/config_external"
      ])
    ];
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = lib.mkMerge [
          (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin [
            "/Users/${user}/.ssh/id_ed25519"
          ])
        ];
      };
    };
  };
}
