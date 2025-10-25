{ lib, config, ... }:

{
  options.modules.gaming.enable = lib.mkEnableOption "Enable gaming-related stuff";

  config = lib.mkIf config.modules.gaming.enable {
    programs = {
      gamemode.enable = true;

      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };
  };
}