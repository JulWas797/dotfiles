{ lib, config, ... }:

{
  options.modules.flood.enable = lib.mkEnableOption "flood";

  config = lib.mkIf config.modules.flood.enable {
    services = {
      flood = {
        enable = true;
        port = 2137;
      };

      transmission.enable = true;
    };
  };
}