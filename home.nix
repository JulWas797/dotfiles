{ pkgs, ... }:

{
  imports = [
    ./user/fetch.nix
    ./user/librewolf.nix
    ./user/zsh.nix
    ./user/konsole.nix
    ./user/git.nix
    ./user/direnv.nix
    ./user/plasma.nix
    ./user/codium.nix
  ];

  home = {
    username = "jwas";
    homeDirectory = "/home/jwas";
    stateVersion = "25.05";

    packages = with pkgs; [
      jetbrains.idea-ultimate
      prismlauncher
    ];

    file = {
      ".sdk/jdk/zulu8".source = pkgs.zulu8.home;
      ".sdk/jdk/zulu11".source = pkgs.zulu11.home;
      ".sdk/jdk/zulu17".source = pkgs.zulu17.home;
      ".sdk/jdk/zulu21".source = pkgs.zulu21.home;
      ".sdk/jdk/jetbrains".source = pkgs.jetbrains.jdk.home;
    };

    sessionVariables = {
      MOZ_ENABLE_WAYLAND=1;
      NIXOS_OZONE_WL=1;
    };
  };

  programs.home-manager.enable = true;
}
