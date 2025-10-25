{ lib, config, ... }:

{
  options.modules._1password.enable = lib.mkEnableOption "Enable 1Password";

  config = lib.mkIf config.modules._1password.enable {
    programs = {
      _1password.enable = true;

      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "jwas" ];
      };
    };

    environment.etc."1password/custom_allowed_browsers" = {
      text = ''
        librewolf
      '';
      mode = "0755";
    };
  };
}