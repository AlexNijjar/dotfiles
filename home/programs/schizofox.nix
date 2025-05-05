{inputs, ...}:
# Some settings taken from: https://github.com/diniamo/niqs/blob/main/home/schizofox.nix
{
  imports = [inputs.schizofox.homeManagerModules.default];
  programs.schizofox = {
    enable = true;

    theme = {
      font = "JetBrainsMono Nerd Font";
      colors = {
        background-darker = "1e1e2e";
        background = "11111b";
        foreground = "cdd6f4";
        primary = "cba6f7";
      };
    };

    search = {
      defaultSearchEngine = "Searx";
      removeEngines = ["DuckDuckGo" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
      searxUrl = "https://search.notashelf.dev";
      searxQuery = "https://search.notashelf.dev/search?q={searchTerms}";
    };

    settings = {
      "privacy.resistFingerprinting" = false;
      "privacy.resistFingerprinting.letterboxing" = false;
      "dom.event.clipboardevents.enabled" = true;
      "browser.download.useDownloadDir" = true;
      "browser.download.always_ask_before_handling_new_types" = false;
      "browser.download.dir" = "~/Downloads";
      "mousewheel.with_control.action" = 0;
      "browser.fullscreen.autohide" = false;
      "ui.key.menuAccessKeyFocuses" = false;
    };

    security = {
      sandbox.enable = false;
      sanitizeOnShutdown.sanitize = {
        downloads = true;
        formdata = true;
        history = true;
      };
      noSessionRestore = true;
    };

    extensions = {
      darkreader.enable = true;
      enableExtraExtensions = true;
      extraExtensions = let
        mkUrl = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
      in {
        "{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = mkUrl "bitwarden-password-manager";
        "DontFuckWithPaste@raim.ist".install_url = mkUrl "don-t-fuck-with-paste";
        "{cb31ec5d-c49a-4e5a-b240-16c767444f62}".install_url = mkUrl "indie-wiki-buddy";
        "idcac-pub@guus.ninja".install_url = mkUrl "istilldontcareaboutcookies";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}".install_url = mkUrl "return-youtube-dislikes";
        "skipredirect@sblask".install_url = mkUrl "skip-redirect";
        "sponsorBlocker@ajay.app".install_url = mkUrl "sponsorblock";
        "uBlock0@raymondhill.net".install_url = mkUrl "ublock-origin";
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".install_url = mkUrl "styl-us";
        "tridactyl.vim@cmcaine.co.uk".install_url = mkUrl "tridactyl-vim";
        "{7b1bf0b6-a1b9-42b0-b75d-252036438bdc}".install_url = mkUrl "youtube-high-definition";
        "{bbb880ce-43c9-47ae-b746-c3e0096c5b76}".install_url = mkUrl "catppuccin-web-file-icons";
      };
    };

    misc = {
      bookmarks = [
        {
          Title = "YouTube";
          URL = "https://www.youtube.com";
          Placement = "toolbar";
        }
        {
          Title = "GitHub";
          URL = "https://github.com/AlexNijjar";
          Placement = "toolbar";
        }
        {
          Title = "Claude";
          URL = "https://claude.ai";
          Placement = "toolbar";
        }
        {
          Title = "ChatGPT";
          URL = "https://chatgpt.com";
          Placement = "toolbar";
        }
        {
          Title = "dotfiles";
          URL = "https://github.com/AlexNijjar/dotfiles";
          Placement = "toolbar";
          Folder = "nixos";
        }
        {
          Title = "nixoptions";
          URL = "https://search.nixos.org/options?channel=unstable";
          Placement = "toolbar";
          Folder = "nixos";
        }
        {
          Title = "nixpkgs";
          URL = "https://search.nixos.org/packages?channel=unstable";
          Placement = "toolbar";
          Folder = "nixos";
        }
        {
          Title = "hm-options";
          URL = "https://rycee.gitlab.io/home-manager/options.xhtml";
          Placement = "toolbar";
          Folder = "nixos";
        }
      ];
    };
  };
}
