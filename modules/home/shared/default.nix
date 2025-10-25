{ ... }:

{
  imports = [
    ./codium
    ./direnv
    ./fetch
    ./ghostwriter
    ./java-development
    ./konsole
    ./librewolf
    ./plasma
    ./zsh
  ];

  home = {
    username = "jwas";
    homeDirectory = "/home/jwas";
    stateVersion = "25.05";

    sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
      NIXOS_OZONE_WL = 1;
    };
  };

  programs.git = {
    enable = true;
    userEmail="51297298+JulWas797@users.noreply.github.com";
    userName="JulWas797";
  };
}