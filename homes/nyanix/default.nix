{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.packages = with pkgs; [
    deadbeef
    prismlauncher
    yt-dlp
  ];

  modules = {
    codium.enable = true;
    direnv.enable = true;
    fetch.enable = true;
    ghostwriter.enable = true;
    java-development.enable = true;
    konsole.enable = true;
    librewolf.enable = true;
    matlab.enable = true;
    plasma.enable = true;
    vencord.enable = true;
    zsh.enable = true;
  };
}