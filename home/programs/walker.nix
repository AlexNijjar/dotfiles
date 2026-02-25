{ pkgs, lib, ... }:
{
  services.walker = {
    enable = true;
    systemd.enable = true;
    settings.theme = "catppuccin";
  };

  home.packages = [ pkgs.elephant ];

  systemd.user.services.elephant = {
    Unit = {
      Description = "Elephant";
      PartOf = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = lib.getExe pkgs.elephant;
      Restart = "on-failure";
    };
  };

  xdg.configFile."walker/themes/catppuccin/style.css".text = ''
    @define-color text rgb(205, 214, 244);
    @define-color subtext0 rgb(166, 173, 200);
    @define-color overlay2 rgb(147, 153, 178);
    @define-color overlay1 rgb(127, 132, 156);
    @define-color overlay0 rgb(108, 112, 134);
    @define-color surface1 rgb(69, 71, 90);
    @define-color surface0 rgb(49, 50, 68);
    @define-color base rgb(30, 30, 46);
    @define-color mauve rgb(203, 166, 247);

    * {
      all: unset;
    }

    scrollbar {
      opacity: 0;
    }

    .window {
      color: @text;
    }

    .box-wrapper {
      border-radius: 12px;
      background: @base;
      padding: 32px;
      border: 2px solid @surface0;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    }

    .search-container {
      background: @surface0;
      padding: 12px;
      margin: 15px;
      border-radius: 12px;
    }

    .input {
      background: none;
      color: @text;
      caret-color: @text;
    }

    .input placeholder {
      color: @overlay0;
    }

    .input selection {
      background: @surface1;
    }

    .item-box {
      padding: 10px;
      margin-bottom: 3px;
      border-radius: 6px;
    }

    child:selected .item-box,
    row:selected .item-box {
      background: alpha(@mauve, 0.4);
    }

    .item-image {
      margin-right: 8px;
    }

    .item-text {
      font-weight: 600;
    }

    .item-subtext {
      color: @overlay1;
      font-size: 0.9em;
    }

    .placeholder,
    .elephant-hint {
      color: @subtext0;
    }

    .keybinds {
      padding-top: 10px;
      border-top: 1px solid @surface0;
      font-size: 12px;
      color: @text;
    }

    .keybind-bind {
      text-transform: lowercase;
      opacity: 0.35;
    }

    .keybind-label {
      padding: 2px 4px;
      border-radius: 4px;
      border: 1px solid @text;
    }

    .error {
      padding: 10px;
      background: rgb(243, 139, 168);
      color: @base;
    }
  '';
}
