{ pkgs, ... }:

let 
  face = ./files/.face;
in
{
  imports = [
    ./modules/fetch.nix
    ./modules/librewolf.nix
    ./modules/zsh.nix
    ./modules/konsole.nix
    ./modules/git.nix
    ./modules/direnv.nix
    ./modules/plasma.nix
    ./modules/codium.nix
    ./modules/ghostwriter.nix
  ];

  home = {
    username = "jwas";
    homeDirectory = "/home/jwas";
    stateVersion = "25.05";

    file = {
      ".sdk/jdk/jetbrains".source = pkgs.jetbrains.jdk.home;
      ".face".source = face;
      ".face.icon".source = face;
    };

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      NIXOS_OZONE_WL = 1;
    };
  };

  programs.home-manager.enable = true;
}
