{inputs, ...}: {
  imports = [inputs.walker.nixosModules.default];

  # Modified theme of: https://github.com/maotseantonio/NixOS-Hyprland/blob/main/configs/walker/themes/catppuccin.css
  programs.walker = {
    enable = true;
    theme = {
      layout = {
        ui.anchors = {
          bottom = true;
          left = true;
          right = true;
          top = true;
        };
        ui.window = {
          h_align = "fill";
          v_align = "fill";
          box = {
            h_align = "center";
            v_align = "center";
            v_expand = true;
            width = 600;
            height = 500;
          };
        };
      };
      style = ''
        @define-color text rgb(205, 214, 244);
        @define-color subtext0 rgb(166, 173, 200);
        @define-color overlay2 rgb(147, 153, 178);
        @define-color overlay1 rgb(127, 132, 156);
        @define-color overlay0 rgb(108, 112, 134);
        @define-color surface1 rgb(69, 71, 90);
        @define-color surface0 rgb(49, 50, 68);
        @define-color base rgb(30, 30, 46);
        @define-color mauve rgb(203, 166, 247);

        #window, #box, #aiScroll, #aiList, #search, #password, #input,
        #prompt, #clear, #typeahead, #list, child, scrollbar, slider,
        #item, #text, #label, #bar, #sub, #activationlabel {
          all: unset;
        }

        #window {
          color: @text;
        }

        #box {
          border-radius: 12px;
          background: @base;
          padding: 32px;
          border: 2px solid @surface0;
          box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        #search {
          background: @surface0;
          padding: 12px;
          margin: 15px;
          border-radius: 12px;
        }

        #prompt {
          margin-left: 4px;
          margin-right: 12px;
          color: @subtext0;
        }

        #clear {
          color: @overlay2;
        }

        #input {
          background: none;
          color: @text;
        }

        #input placeholder {
          color: @overlay0;
        }

        child {
          padding: 10px;
          margin-bottom: 3px;
          border-radius: 6px;
        }

        child:selected, child:hover {
          background: alpha(@mauve, 0.4);
        }

        #icon {
          margin-right: 8px;
        }

        #label {
          font-weight: 600;
        }

        #sub {
          color: @overlay1;
          font-size: 0.9em;
        }

        .aiItem {
          padding: 10px;
          border-radius: 6px;
          color: @text;
          background: @surface0;
          margin-bottom: 5px;
        }

        .aiItem.assistant {
          background: @surface1;
        }
      '';
    };
  };
}
