{ lib, config, pkgs, ... }:

{
  options.modules.konsole.enable = lib.mkEnableOption "Enable Konsole (KDE)";

  config = lib.mkIf config.modules.konsole.enable {
    programs.konsole = {
      enable = true;
      defaultProfile = "Nyanix";

      customColorSchemes.tokyonight =
        let
          tokyo-night-git = pkgs.fetchFromGitHub {
            repo = "tokyonight.nvim";
            owner = "folke";
            rev = "5da1b76e64daf4c5d410f06bcb6b9cb640da7dfd";
            hash = "sha256-4zfkv3egdWJ/GCWUehV0MAIXxsrGT82Wd1Qqj1SCGOk=";
          };
        in
      "${tokyo-night-git}/extras/konsole/tokyonight_night.colorscheme";

      profiles = {
        "Nyanix" = {
          colorScheme = "tokyonight";
          
          font = {
            name = "FiraCode Nerd Font";
            size = 10;
          };
        };
      };
    };
  }; 
}