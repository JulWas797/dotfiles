{ lib, config, pkgs, ... }:

{
  options.modules.maven.enable = lib.mkEnableOption "maven repository";

  config = lib.mkIf config.modules.maven.enable {
    services.reposilite = {
      enable = true;

      plugins = with pkgs.reposilitePlugins; [
        groovy
        checksum
      ];
    };
  };
}