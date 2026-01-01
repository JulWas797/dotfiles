{ lib, config, pkgs, ... }:

{
  options.modules.jellyfin.enable = lib.mkEnableOption "jellyfin";

  config = lib.mkIf config.modules.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
      ffmpeg-full
    ];
  };
}