{ lib, config, ... }:

{
  options.modules.forgejo.enable = lib.mkEnableOption "forgejo";

  config = lib.mkIf config.modules.forgejo.enable {
    services.forgejo = {
      enable = true;
      lfs.enable = true;
      
      settings = {
        server.HTTP_PORT = 3001;
      };
    };
  };
}