{ lib, config, pkgs, ... }:

# TODO: MOVE OUT TO HOME MANAGER!
{
  options.modules.userapps.enable = lib.mkEnableOption "Enable user apps and fonts";

  config = lib.mkIf config.modules.userapps.enable {
    environment = {
      systemPackages = with pkgs; [
        ayugram-desktop
        btop
        imagemagick
        nixd
        onlyoffice-bin
      ];  
    };

    fonts.packages = with pkgs; [
      helvetica-neue-lt-std
      nerd-fonts.fira-code
    ];
  };
}