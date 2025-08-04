{ config, pkgs, ... }:

{
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
		"network.captive-portal-service.enabled" = false;
		"widget.use-xdg-desktop-portal.file-picker" = "1";
	  };
	};

	nativeMessagingHosts = [ pkgs.kdePackages.plasma-browser-integration ];
  };
}
