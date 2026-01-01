{ lib, config, ... }:

{
  options.modules.cloudflared.enable = lib.mkEnableOption "cloudflared";

  config = lib.mkIf config.modules.cloudflared.enable {
    services.cloudflared = {
      enable = false;

      
    };
  };
}