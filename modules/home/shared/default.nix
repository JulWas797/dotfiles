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
    ./matlab
    ./plasma
    ./sops
    ./sway
    ./tex
    ./torrenting
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
      email = "51297298+JulWas797@users.noreply.github.com";
      name = "JulWas797";
    };
  };
}