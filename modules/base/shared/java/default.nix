{ lib, config, pkgs, ... }:

{
  options.modules.java.enable = lib.mkEnableOption "Enable Java";

  config = lib.mkIf config.modules.java.enable {
    programs = {
      java = {
        enable = true;
        package = pkgs.jetbrains.jdk;
      };
    };
  };
}