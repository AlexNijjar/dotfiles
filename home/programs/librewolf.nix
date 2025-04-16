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
          meta = { };
        })
      ];

      bookmarks = {
        force = true;
        settings = [
          {
            name = "YouTube";
            url = "https://youtube.com";
          }
          {
            name = "GitHub";
            url = "https://github.com/AlexNijjar";
          }
          {
            name = "nixos";
            toolbar = true;
            bookmarks = [
              {
                name = "dotfiles";
                url = "https://github.com/AlexNijjar/dotfiles";
              }
              {
                name = "nixoptions";
                url = "https://search.nixos.org/options?channel=unstable";
              }
              {
                name = "nixpkgs";
                url = "https://search.nixos.org/packages?channel=unstable";
              }
              {
                name = "hm-options";
                url = "https://rycee.gitlab.io/home-manager/options.xhtml";
              }
            ];
          }
        ];
      };

      search = {
        force = true;
        default = " google ";
        engines = {
          nix-packages = {
            name = "
                  Nix
                  Packages ";
            urls = [{
              template = " https://search.nixos.org/packages ";
              params = [
                {
                  name = "
                  type ";
                  value = "
                  packages ";
                }
                {
                  name = "
                  query ";
                  value = " { searchTerms }";
                }
              ];
            }];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };
          bing.metaData.hidden = true;
          wikipedia.metaData.hidden = true;
        };
      };
    };

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
}
