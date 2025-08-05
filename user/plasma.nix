{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    fonts.fixedWidth = {
      family = "FiraCode Nerd Font Mono";
      pointSize = 10;
    };
  };
}
