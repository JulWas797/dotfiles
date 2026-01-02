{ lib, config, pkgs, ... }:

{
  options.modules.maven.enable = lib.mkEnableOption "maven repository";

  config = lib.mkIf config.modules.maven.enable {
    services.reposilite = {
      enable = true;
      extraArgs = [ "--token" "name:tempsecrettoken" ];

      plugins = with pkgs.reposilitePlugins; [
        groovy
        checksum
      ];
    };
  };
}