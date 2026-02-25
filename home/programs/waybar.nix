{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "hyprland-session.target";
    };

    settings.default = {
      layer = "top";
      position = "top";

      modules-left = ["hyprland/workspaces" "hyprland/window"];
      modules-center = ["clock"];
      modules-right = ["custom/recording" "mpris" "cava" "wireplumber" "cpu" "memory" "custom/gpu" "custom/vram" "temperature" "disk" "tray"];

      "hyprland/workspaces" = {
        disable-scroll = true;
        sort-by-name = true;
        format = " {icon} ";
        format-icons = {
          default = "";
        };
      };

      "hyprland/window" = {
        max-length = 100;
        separate-outputs = true;
      };

      clock = {
        format = "{:%I:%M:%S %p %b %d}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        interval = 1;
      };

      "custom/recording" = {
        format = "{}";
        interval = 1;
        exec = pkgs.writeShellScript "recording-status" ''
          if ${pkgs.procps}/bin/pgrep wl-screenrec > /dev/null 2>&1; then
            printf '{"text": "󰑊", "class": "recording", "tooltip": "Recording"}'
          else
            printf '{"text": "", "class": "not-recording"}'
          fi
        '';
        return-type = "json";
      };

      mpris = {
        format = "{player_icon} {dynamic}";
        format-paused = "{status_icon} <i>{dynamic}</i>";
        on-click = "playerctl play-pause";
        dynamic-len = 60;
        interval = 1;
        player-icons = {
          default = "▶";
          mpv = "🎵";
          spotify = "";
        };
        status-icons = {
          paused = "▮▮";
        };
      };

      cava = {
        format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        bars = 14;
        bar_delimiter = 0;
        noise_reduction = 0.77;
        input_delay = 2;
      };

      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = ["" "" ""];
        on-click = "pavucontrol";
      };

      cpu = {
        format = " {usage}%";
        interval = 5;
        on-click = "ghostty -e btop";
      };

      memory = {
        format = "󰆼 {percentage}%";
        interval = 5;
        on-click = "ghostty -e btop";
      };

      "custom/gpu" = {
        format = "󰾲 {}%";
        interval = 5;
        on-click = "ghostty -e btop";
        exec = "${pkgs.rocmPackages.rocm-smi}/bin/rocm-smi -u --json | ${pkgs.jq}/bin/jq '.card0.\"GPU use (%)\" | tonumber'";
        tooltip = "GPU";
      };

      "custom/vram" = {
        format = "󰆼 {}%";
        interval = 5;
        on-click = "ghostty -e btop";
        exec = "${pkgs.rocmPackages.rocm-smi}/bin/rocm-smi --showmemuse --json | ${pkgs.jq}/bin/jq '.card0.\"GPU Memory Allocated (VRAM%)\" | tonumber'";
        tooltip = "GPU";
      };

      temperature = {
        format = "󰔏 {temperatureC}°C";
        interval = 5;
        on-click = "ghostty -e btop";
        hwmon-path = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input";
      };

      disk = {
        format = "󰋊 {percentage_used}%";
        interval = 30;
        on-click = "ghostty -e btop";
        path = "/";
      };

      tray = {
        icon-size = 21;
        spacing = 10;
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        min-height: 0;
      }

      #waybar {
        background: transparent;
      }

      #window,
      #clock,
      #mpris,
      #cava,
      #wireplumber,
      #cpu,
      #memory,
      #custom-gpu,
      #custom-vram,
      #temperature,
      #disk {
        color: @mauve;
        background-color: @surface0;
        padding: 0.5rem;
        margin: 2px 0px;
      }

      #workspaces,
      #window,
      #clock,
      #mpris {
        border-radius: 1rem;
      }

      #workspaces {
        background-color: @surface0;
        margin: 2px 0 0 1rem;
      }

      #workspaces button {
        color: @mauve;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: @sapphire;
      }

      #workspaces button:hover {
        color: @sky;
      }

      #window {
        margin-left: 1rem;
      }

      #custom-recording.recording {
        color: #ff0000;
        background-color: @surface0;
        padding: 0.5rem 1rem;
        margin: 2px 0px;
        border-radius: 1rem;
        margin-right: 1rem;
      }

      #custom-recording.not-recording {
        padding: 0;
        margin: 0;
      }

      #mpris {
        margin-right: 1rem;
      }

      #cava {
        border-radius: 1rem 0px 0px 1rem;
      }

      #wireplumber {
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #cpu {
        border-radius: 1rem 0px 0px 1rem;
      }

      #disk {
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #tray {
        background-color: @surface0;
        color: @mauve;
        border-radius: 1rem;
        margin: 2px 1rem 2px 0;
      }

      #tray > * {
        padding: 0.5rem;
      }
    '';
  };
}
