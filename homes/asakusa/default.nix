{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.packages = with pkgs; [
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
    onlyoffice.enable = true;
    sops.enable = true;
    plasma.enable = true;
    photography.enable = true;
    torrenting.enable = true;
    userapps.enable = true;
    vencord.enable = true;
    zsh.enable = true;
  };
}