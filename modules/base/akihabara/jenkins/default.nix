{ lib, config, pkgs, ... }:

{
  options.modules.jenkins.enable = lib.mkEnableOption "jenkins";

  config = lib.mkIf config.modules.jenkins.enable {
    services.jenkins = {
      enable = true;
      javaPackage = pkgs.zulu21;
      extraJavaOptions = [ "-Xmx256m" ];
    };
  };
}