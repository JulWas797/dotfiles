{ lib, config, pkgs, ... }:

{
  options.modules.librewolf.enable = lib.mkEnableOption "Enable Librewolf";

  config = lib.mkIf config.modules.librewolf.enable {
    programs.librewolf = {
      enable = true;

      languagePacks = [
        "en-US"
        "pl"
      ];

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        CaptivePortal  = false;
        DisableTelemetry = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DontCheckDefaultBrowser = true;

        EncryptedMediaExtensions = false;
        HardwareAcceleration = true;

        ExtensionSettings = {
          "7esoorv3@alefvanoon.anonaddy.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/libredirect/latest.xpi";
            installation_mode = "force_installed";
          };
          "sponsorBlocker@ajay.app" = {
            install_url ="https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
          };
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };
          "gdpr@cavi.au.dk" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/consent-o-matic/latest.xpi";
            installation_mode = "force_installed";
          };
          "plasma-browser-integration@kde.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
            installation_mode = "force_installed";
          };
          "DontFuckWithPaste@raim.ist" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/don-t-fuck-with-paste/latest.xpi";
            installation_mode = "force_installed";
          };
          "CanvasBlocker@kkapsner.de" =  {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/canvasblocker/latest.xpi";
            installation_mode = "force_installed";
          };
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "force_installed";
          };
          "{458160b9-32eb-4f4c-87d1-89ad3bdeb9dc}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-anti-translate/latest.xpi";
            installation_mode = "force_installed";
          };
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };
          "{4520dc08-80f4-4b2e-982a-c17af42e5e4d}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tokyo-night-milav/latest.xpi";
            installation_mode = "force_installed";
          };
        };

        ManualAppUpdateOnly = true;
        NetworkPrediction = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        PasswordManagerEnabled = false;

        Preferences = {
          "app.normandy.api_url" = "";
          "app.normandy.enabled" = false;
          "app.shield.optoutstudies.enabled" = false;
          "beacon.enabled" = false;
          "browser.aboutConfig.showWarning" = false;
          "browser.send_pings" = false;
          "browser.send_pings.require_same_host" = true;
          "dom.webnotifications.enabled" = false;
          "media.eme.enabled" = false;
          "media.gmp-widevinecdm.enabled" = false;
          # "media.peerconnection.enabled" = false;
          "network.IDN_show_punycode" = true;
          "network.captive-portal-service.enabled" = false;
          "network.dns.disablePrefetch" = true;
          "network.dns.disablePrefetchFromHTTPS" = true;
          "network.http.referer.spoofSource" = true;
          "network.http.speculative-parallel-limit" = 0;
          "network.predictor.enable-prefetch" = false;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "extensions.activeThemeID" = "{4520dc08-80f4-4b2e-982a-c17af42e5e4d}";
        } // lib.optionalAttrs config.modules.sway.enable {
          "browser.tabs.inTitlebar" = 0;
        };
      };

      nativeMessagingHosts = lib.mkIf config.modules.plasma.enable [ pkgs.kdePackages.plasma-browser-integration ];
    };
  }; 
}