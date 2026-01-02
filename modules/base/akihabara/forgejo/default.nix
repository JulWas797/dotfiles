{ lib, config, ... }:

{
  options.modules.forgejo.enable = lib.mkEnableOption "forgejo";

  config = lib.mkIf config.modules.forgejo.enable {
    services.forgejo = {
      enable = true;
      lfs.enable = true;
      
      settings = {
        DEFAULT.APP_NAME = "jwas git";
        
        server = {
          DOMAIN = "git.jwas.pl";
          ROOT_URL = "https://git.jwas.pl/";
          HTTP_PORT = 3001;
          LANDING_PAGE = "explore";
        };

        session.COOKIE_SECURE = true;
        service.DISABLE_REGISTRATION = true; 
        ui.DEFAULT_THEME = "forgejo-dark";
      };
    };
  };
}