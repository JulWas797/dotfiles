{ lib, config, ... }:

{
  options.modules.jellyfin.enable = lib.mkEnableOption "jellyfin";

  config = lib.mkIf config.modules.jellyfin.enable {
    services.jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}