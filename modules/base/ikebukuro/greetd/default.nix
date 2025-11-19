{ lib, config, pkgs, ... }: 

{
  options.modules.greetd.enable = lib.mkEnableOption "greetd";

  config = lib.mkIf config.modules.greetd.enable {
    services.greetd = {
      enable = true;  

      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
          user = "greeter";
        };
      };
    };
  };
}