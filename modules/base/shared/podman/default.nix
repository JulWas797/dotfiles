{ lib, config, ... }:

{
  options.modules.podman.enable = lib.mkEnableOption "Enable Podman";

  config = lib.mkIf config.modules.podman.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}