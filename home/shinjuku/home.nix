{ ... }:

{
  imports = [
    ../shared/home.nix
  ];

  programs.plasma.workspace.wallpaper = "${./files/wallpaper.jpg}";
}
