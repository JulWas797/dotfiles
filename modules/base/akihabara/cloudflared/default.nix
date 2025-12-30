{ lib, config, ... }:

{
  options.modules.cloudflared.enable = lib.mkEnableOption "cloudflared";

  config = lib.mkIf config.modules.cloudflared.enable {
    sops.secrets = {
      "cloudflared-pem" = {
        format = "binary";
        sopsFile = ../../../../secrets/homelab/cloudflared.pem;
      };

      "cloudflared-jellyfin-key" = {
        format = "binary";
        sopsFile = ../../../../secrets/homelab/cloudflared_jellyfin_key.json;
      };
    };

    environment.etc."cloudflared/cert.pem".source = config.sops.secrets.cloudflared-pem.path;

    services.cloudflared = {
      enable = true;

      tunnels."8d086ae4-a829-4a2b-874b-6b2ef0ba2321" = {
        credentialsFile = "${config.sops.secrets.cloudflared-jellyfin-key.path}";
        default = "http_status:404";
      };
    };
  };
}