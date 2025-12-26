{ lib, config, pkgs, ... }:

{
  options.modules.onlyoffice.enable = lib.mkEnableOption "Onlyoffice";

  config = lib.mkIf config.modules.onlyoffice.enable {
    home = {
      packages = [ pkgs.onlyoffice-desktopeditors ];
      
      activation.copy-fonts-local-share = lib.hm.dag.entryAfter ["writeBoundary"] ''
        run rm -rf $HOME/.local/share/fonts
        run mkdir -p $HOME/.local/share/fonts
        run cp ${pkgs.corefonts}/share/fonts/truetype/* $HOME/.local/share/fonts/
        run chmod 544 $HOME/.local/share/fonts
        run chmod 444 $HOME/.local/share/fonts/*
      '';
    };
  };
}