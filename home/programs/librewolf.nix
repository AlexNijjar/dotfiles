{
  programs.librewolf = {
    enable = true;
    policies = {
      BlockAboutConfig = true;
      DefaultDownloadDirectory = "/home/alex/Downloads";
      DisablePocket = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        catppuccin-web-file-icons
        darkreader
        firefox-color
        indie-wiki-buddy
        istilldontcareaboutcookies
        return-youtube-dislikes
        sponsorblock
        styl-us
        ublock-origin
        youtube-high-definition
      ];

      settings = {
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
      };
    };
  };
}
