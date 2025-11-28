{ lib, config, ... }:

{
  options.modules.ghostwriter.enable = lib.mkEnableOption "Enable ghostwriter";

  config = lib.mkIf config.modules.ghostwriter.enable {
    programs.ghostwriter = {
      enable = true;

      font = {
        family = "BlexMono Nerd Font";
        pointSize = 12;
      };
    };
  }; 
}