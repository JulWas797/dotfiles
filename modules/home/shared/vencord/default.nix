{ lib, config, ... }:

{
  options.modules.vencord.enable = lib.mkEnableOption "Vencord";

  config = lib.mkIf config.modules.vencord.enable {
    programs.vesktop = {
      enable = true;

      settings = {
        appBadge = false;
        checkUpdates = false;
        customTitleBar = false;
        disableMinSize = true;
        minimizeToTray = false;
        staticTitle = true;
        splashPixelated = true;
        tray = false;
        hardwareAcceleration = true;
        discordBranch = "stable";
      };

      vencord.settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        themeLinks = [ "https://raw.githubusercontent.com/Dyzean/Tokyo-Night/main/themes/tokyo-night.theme.css" ];
        enabledTheme = [ "tokyo-night.theme.css" ];
        disableMinSize = true;

        plugins = {
          AccountPanelServerProfile.enabled = true;
          
          AnonymiseFileNames = {
            enabled = true;
            anonymiseByDefault = false;
          };

          BetterSettings.enabled = true;
          CallTimer.enabled = true;
          ClearURLs.enabled = true;
          FakeNitro.enabled = true;
          FixYoutubeEmbeds.enabled = true;
          ForceOwnerCrown.enabled = true;
          FriendsSince.enabled = true;
          ImageFilename.enabled = true;
          ImageZoom.enabled = true;
          MemberCount.enabled = true;
          MentionAvatars.enabled = true;
          MessageLinkEmbeds.enabled = true;

          MessageLogger = {
            enabled = true;
            ignoreBots = true;
            ignoreSelf = true;
          };

          NoProfileThemes.enabled = true;
          NoServerEmojis.enabled = true;
          NoTrack.enabled = true;
          NoTypingAnimation.enabled = true;
          PlatformIndicators.enabled = true;
          ServerInfo.enabled = true;
          ShowTimeoutDuration.enabled = true;
          Translate.enabled = true;
          UserVoiceShow.enabled = true;
          ValidReply.enabled = true;
          ValidUser.enabled = true;
          VoiceMessages.enabled = true;
          YoutubeAdblock.enabled = true;
        };
      };
    };
  }; 
}