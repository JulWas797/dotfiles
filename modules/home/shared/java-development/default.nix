{ lib, config, pkgs, ... }:

{
  options.modules.java-development.enable = lib.mkEnableOption "Java runtimes & IDE(s)";

  config = lib.mkIf config.modules.java-development.enable {
    home = {
      packages = with pkgs; [ jetbrains.idea-ultimate ];

      file = {
        ".sdk/jdk/jetbrains".source = pkgs.jetbrains.jdk.home;
        ".sdk/jdk/zulu8".source = pkgs.zulu8.home;
        ".sdk/jdk/zulu11".source = pkgs.zulu11.home;
        ".sdk/jdk/zulu17".source = pkgs.zulu17.home;
        ".sdk/jdk/zulu21".source = pkgs.zulu21.home;
      };
    };
  }; 
}