{ lib, config, ... }:

{
  options.modules.sops.enable = lib.mkEnableOption "sops";

  config = lib.mkIf config.modules.sops.enable {
    sops = {
      age.keyFile = "/home/jwas/.config/sops/age/keys.txt";

      defaultSopsFormat = "yaml";
      defaultSopsFile = ../../secrets/default.yaml;
    };
  };
}
