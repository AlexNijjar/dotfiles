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
      enableLuaLoader = true;

      options = {
        autoindent = true;
        smartindent = true;
        tabstop = 4;
        softtabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        wrap = false;
        scroll = 0;
      };

      undoFile.enable = true;

      assistant.copilot = {
        enable = true;
        setupOpts = {
          suggestion.auto_trigger = true;
          filetypes = {
            markdown = true;
            yaml = true;
          };
        };
      };

      telescope = {
        enable = true;
        setupOpts = {
          pickers.find_files.find_command = [
            "${pkgs.fd}/bin/fd"
            "--type=file"
            "--hidden"
          ];
          defaults.vimgrep_arguments = [
            "${pkgs.ripgrep}/bin/rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"
          ];
        };
        mappings = {
          lspReferences = "<leader>lgr";
          lspDefinitions = "<leader>lgd";
          lspImplementations = "<leader>lgi";
          lspTypeDefinitions = "<leader>lgt";
          gitStatus = "<leader>gd";
          diagnostics = "<leader>ld";
        };
      };

      notify.nvim-notify.enable = true;

      utility = {
        vim-wakatime.enable = true;
        yazi-nvim.enable = true;
        mkdir.enable = true;
      };

      projects.project-nvim = {
        enable = true;
        setupOpts = {
          manual_mode = false;
          detection_methods = ["pattern"];
          patterns = [".git"];
        };
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
