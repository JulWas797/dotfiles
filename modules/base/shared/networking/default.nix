{ lib, config, ... }:

let
  networksRoot = ../../../../secrets/networks;

  secret = path: key: { 
    sopsFile = path; 
    inherit key; 
  };

  getNetworks = dir: 
    lib.mapAttrsToList (
      file: _: {
        name = lib.removeSuffix ".yaml" file;
        path = "${dir}/${file}";
      }
    ) (lib.filterAttrs (n: v: v == "regular" && lib.hasSuffix ".yaml" n) (builtins.readDir dir));

  pskNetworks = getNetworks "${networksRoot}/psk";
  eapNetworks = getNetworks "${networksRoot}/eap";

  mkSecretSet = keys: nets:
    lib.mergeAttrsList (map ({ name, path }:
      lib.listToAttrs (map (key: {
        name = "${name}/${key}";
        value = secret path key;
      }) keys)
    ) nets);

  pskSecrets = mkSecretSet [ "ssid" "psk" ] pskNetworks;
  eapSecrets = mkSecretSet [ "ssid" "identity" "password" ] eapNetworks;

  mkConnection = name: type: content: {
    "NetworkManager/system-connections/${name}.nmconnection" = {
      path = "/run/NetworkManager/system-connections/${name}.nmconnection";
      mode = "0600";
      inherit content;
    };
  };

  pskTemplates = lib.mergeAttrsList (map ({ name, ... }: mkConnection name "psk" ''
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
  '') pskNetworks);

  eapTemplates = lib.mergeAttrsList (map ({ name, ... }: mkConnection name "eap" ''
    [connection]
    id=${config.sops.placeholder."${name}/ssid"}
    type=wifi
    autoconnect=true

    [wifi]
    mode=infrastructure
    ssid=${config.sops.placeholder."${name}/ssid"}

    [wifi-security]
    key-mgmt=wpa-eap

    [802-1x]
    eap=peap;
    phase2-auth=mschapv2
    identity=${config.sops.placeholder."${name}/identity"}
    password=${config.sops.placeholder."${name}/password"}

    [ipv4]
    method=auto
  '') eapNetworks);
in
{
  options.modules.networking.enable = lib.mkEnableOption "Networking";

  config = lib.mkIf config.modules.networking.enable {
    sops.secrets = pskSecrets // eapSecrets;
    sops.templates = pskTemplates // eapTemplates;
  };
}