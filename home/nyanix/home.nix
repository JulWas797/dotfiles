{ pkgs, ... }:

{
  imports = [
    ./modules/zsh.nix
    ../shared/home.nix
  ];

  home = {
    packages = with pkgs; [
      deadbeef
      jetbrains.idea-ultimate
      prismlauncher
      yt-dlp
    ];

    file = {
      ".sdk/jdk/zulu8".source = pkgs.zulu8.home;
      ".sdk/jdk/zulu11".source = pkgs.zulu11.home;
      ".sdk/jdk/zulu17".source = pkgs.zulu17.home;
      ".sdk/jdk/zulu21".source = pkgs.zulu21.home;
    };
  };
}
