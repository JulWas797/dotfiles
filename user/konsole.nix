{ pkgs, config, ... }:

let
  sweet-kde-theme = pkgs.fetchFromGitHub {
    repo = "Sweet";
    owner = "EliverLara";
    rev = "8877bf54da60b0cdc3f18da43a2aa8d3dd5420f2";
    hash = "sha256-WjmnHBd3icUCBKOCBsOMzk3eTMvT0MnykrIWwye+snA=";
  };
in
{
  programs.konsole = {
    enable = true;
    defaultProfile = "Nyanix";

    customColorSchemes.sweet = "${sweet-kde-theme}/kde/konsole/Sweet-Ambar-Blue.colorscheme";

    profiles = {
	  "Nyanix" = {
        colorScheme = "sweet";
        font = {
          name = "FiraCode Nerd Font";
          size = 10;
        };
	  };
    };
  };
}
