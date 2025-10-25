{ ... }:

{
  imports = [
    ../../modules/home
  ];

  programs.plasma.workspace.wallpaper = "${./resources/wallpaper.jpg}";

  modules = {
    codium.enable = true;
    direnv.enable = true;
    fetch.enable = true;
    ghostwriter.enable = true;
    konsole.enable = true;
    librewolf.enable = true;
    plasma.enable = true;
    zsh.enable = true;
  };
}
