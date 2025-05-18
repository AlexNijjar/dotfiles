{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nvf.nixosModules.default
    ./neovim/binds.nix
    ./neovim/languages.nix
    ./neovim/neogit.nix
    ./neovim/theme.nix
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    settings.vim = {
      viAlias = true;
      vimAlias = true;
      searchCase = "smart";

      options = {
        autoindent = true;
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        wrap = false;
        scroll = 0;
      };

      assistant.copilot = {
        enable = true;
        cmp.enable = true;
      };

      telescope = {
        enable = true;
        setupOpts = {
          pickers.find_files.find_command = [
            "${pkgs.fd}/bin/fd"
            "--type=file"
            "--hidden"
            "--no-ignore"
            "--exclude=.venv"
            "--exclude=.idea"
            "--exclude=assets"
            "--exclude=.husky"
          ];
        };
      };

      notify.nvim-notify.enable = true;
      terminal.toggleterm = {
        enable = true; # TODO enable insert_mappings & terminal_mappings
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      utility = {
        vim-wakatime.enable = true;
        multicursors.enable = true;
        yazi-nvim.enable = true;
        diffview-nvim.enable = true;
      };

      navigation.harpoon.enable = true;

      projects.project-nvim = {
        enable = true;
        setupOpts.manual_mode = false;
      };

      git = {
        enable = true;
        gitsigns = {
          enable = true;
          setupOpts = {
            current_line_blame = true;
            current_line_blame_opts = {
              virt_text_pos = "right_align";
              delay = 500;
            };
          };
        };
      };
    };
  };
}
