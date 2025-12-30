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
        format = "json";
        sopsFile = ../../../../secrets/homelab/cloudflared_jellyfin_key.json;
      };

      "cloudflared-jellyfin-uuid-key" = {
        key = "key";
        sopsFile = ../../../../secrets/homelab/cloudflared_jellyfin_data.yaml;
      };

      "cloudflared-jellyfin-domain" = {
        key = "domain";
        sopsFile = ../../../../secrets/homelab/cloudflared_jellyfin_data.yaml;
      };
    };

    environment.etc."cloudflared/cert.pem".source = config.sops.secrets.cloudflared-pem.path;

    services.cloudflared = {
      enable = true;

      tunnels."${config.sops.secrets.cloudflared-jellyfin-uuid-key}" = {
        credentialsFile = "${config.sops.secrets.cloudflared-jellyfin-key.path}";
        default = "http_status:404";
        ingress."${config.sops.secrets.cloudflared-jellyfin-domain}".service = "http://localhost:8096";
      };
    };
  };
}