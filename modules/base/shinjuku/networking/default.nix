{ lib, config, ... }:

#TODO: fix

let
  networks = ../../../../secrets/networks;

  mkWifi = name: {
    sops = {
      secrets = 
        let 
          sopsPath = "${networks}/${name}.yaml";
        in 
      {
        "${name}/ssid" = { sopsFile = sopsPath; key = "ssid"; };
        "${name}/psk"  = { sopsFile = sopsPath; key = "psk"; };
      };

      templates."NetworkManager/system-connections/${name}.nmconnection" = {
        path = "/run/NetworkManager/system-connections/${name}.nmconnection";
        mode = "0600";
        content = ''
          [connection]
          id=${config.sops.placeholder."${name}/ssid"}
          type=wifi
          autoconnect=true

          [wifi]
          mode=infrastructure
          ssid=${config.sops.placeholder."${name}/ssid"}

          [wifi-security]
          auth-alg=open
          key-mgmt=wpa-psk
          psk=${config.sops.placeholder."${name}/psk"}

          [ipv4]
          method=auto
        '';
      };
    };
  };
in
{
  options.modules.networking.enable = lib.mkEnableOption "Networking";

  config = lib.mkIf config.modules.networking.enable (lib.mkMerge [
    {
      networking.networkmanager.enable = true;

      sops.secrets = 
        let
          eduroam = ../../../../secrets/networks/eduroam.yaml;
        in 
      {
        "eduroam/identity" = { sopsFile = eduroam; key = "identity"; };
        "eduroam/password" = { sopsFile = eduroam; key = "password"; };
      };

      sops.templates = 
        let 
          wifiName = "eduroam";
          nmPath = "NetworkManager/system-connections/${wifiName}.nmconnection";
        in 
      {
        ${nmPath} = {
          path = "/run/${nmPath}";
          mode = "0600";
          content = ''
            [connection]
            id=${wifiName}
            type=wifi
            autoconnect=true

            [wifi]
            mode=infrastructure
            ssid=${wifiName}

            [wifi-security]
            key-mgmt=wpa-eap

            [802-1x]
            eap=peap;
            identity=${config.sops.placeholder."${wifiName}/identity"}
            password=${config.sops.placeholder."${wifiName}/password"}
            phase2-auth=mschapv2

            [ipv4]
            method=auto
          '';
        };
      };
    }

    (mkWifi "home5g")
    (mkWifi "hotspot")
  ]);
}