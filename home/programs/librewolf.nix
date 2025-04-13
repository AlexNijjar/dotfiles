{ pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    policies = {
      DefaultDownloadDirectory = "/home/alex/Downloads";
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
        darkreader
        firefox-color
        indie-wiki-buddy
        istilldontcareaboutcookies
        return-youtube-dislikes
        sponsorblock
        stylus
        ublock-origin
        youtube-high-definition

        (buildFirefoxXpiAddon {
          pname = "catppuccin-web-file-icons";
          version = "1.0.1";
          addonId = "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}";
          url = "https://addons.mozilla.org/firefox/downloads/file/4470306/catppuccin_web_file_icons-1.0.1.xpi";
          sha256 = "7a4b84739675110e9ce2e9cda597521e255a9fc205cfbfdae808549dd04c256c";
          meta = {};
        })
      ];

      settings = {
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;
        "browser.toolbars.bookmarks.visibility" = "always";
        "browser.search.separatePrivateDefault" = false;
        "extensions.autoDisableScopes" = 0;
        "ui.systemUsesDarkTheme" = true;
        "devtools.everOpened" = true;
        "app.update.auto" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.showHome" = false;
        "extensions.allowPrivateBrowsingByDefault" = true;
      };
    };
  };
}
