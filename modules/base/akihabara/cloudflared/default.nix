{ lib, config, ... }:

{
  options.modules.cloudflared.enable = lib.mkEnableOption "cloudflared";

  config = lib.mkIf config.modules.cloudflared.enable {
    services.cloudflared = {
      enable = false;

      tunnels = {
        "11fb3be3-7888-4ef5-ad09-2ee9766d5cff" = {
          credentialsFile = "/etc/cloudflared/11fb3be3-7888-4ef5-ad09-2ee9766d5cff.json";
          default = "http_status:404";
        };
      };  
    };
  };
}