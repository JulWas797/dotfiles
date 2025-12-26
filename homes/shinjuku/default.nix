{ ... }:

{
  imports = [
    ../../modules/home
  ];

  programs.plasma.workspace.wallpaper = "${./resources/wallpaper.png}";

  modules = {
    codium.enable = true;
    direnv.enable = true;
    fetch.enable = true;
    ghostwriter.enable = true;
    java-development.enable = true;
    konsole.enable = true;
    librewolf.enable = true;
    onlyoffice.enable = true;
    matlab.enable = true;
    sops.enable = true;
    plasma.enable = true;
    tex.enable = true;
    userapps.enable = true;
    vencord.enable = true;
    zsh.enable = true;
  };
}
