{ pkgs, ... }:

{
  imports = [
    ./codium
    ./direnv
    ./fetch
    ./ghostwriter
    ./java-development
    ./konsole
    ./librewolf
    ./onlyoffice
    ./photography
    ./plasma
    ./sops
    ./ssh
    ./sway
    ./tex
    ./torrenting
    ./userapps
    ./vencord
    ./zsh
  ];

  home = {
    username = "jwas";
    homeDirectory = "/home/jwas";
    stateVersion = "25.11";

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      NIXOS_OZONE_WL = 1;
    };
  };

  programs.git = {
    enable = true;

    settings.user = {
      email = "admin@jwas.pl";
      name = "jwas";
    };
  };
}