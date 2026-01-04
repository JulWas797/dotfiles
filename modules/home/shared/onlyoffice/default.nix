{ lib, config, pkgs, ... }:

{
  options.modules.onlyoffice.enable = lib.mkEnableOption "Onlyoffice";

  config = lib.mkIf config.modules.onlyoffice.enable {
    home = {
      packages = [ pkgs.onlyoffice-desktopeditors ];
      
      # activation.copy-fonts-local-share =   lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      #   run mkdir -p "$HOME/.local/share/fonts"
      #   run chmod u+w "$HOME/.local/share/fonts" || true
      #   run chmod u+w "$HOME/.local/share/fonts/"* || true
      #   run rm -f "$HOME/.local/share/fonts/"*
      #   run cp ${pkgs.corefonts}/share/fonts/truetype/* "$HOME/.local/share/fonts/"
      #   run chmod 555 "$HOME/.local/share/fonts"
      #   run chmod 444 "$HOME/.local/share/fonts/"*
      # '';
    };
  };
}