{ pkgs }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/configuration.nix
  ];

  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  networking.hostName = "nyanix";
}