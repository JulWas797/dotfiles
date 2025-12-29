{ lib, config, ... }:

{
  options.modules.adb.enable = lib.mkEnableOption "adb";

  config = lib.mkIf config.modules.adb.enable {
    programs.adb.enable = true;
    
    users.users.jwas.extraGroups = [ "adbusers" ];
  };
}