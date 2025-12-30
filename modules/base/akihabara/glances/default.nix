{ lib, config, ... }:

{
  options.modules.glances.enable = lib.mkEnableOption "glances";

  config = lib.mkIf config.modules.glances.enable {
    services.glances = {
      enable = true;
      openFirewall = true;
      
      extraArgs = [ "--webserver" ];
    };
  };
}