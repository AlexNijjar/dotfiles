{inputs, ...}: {
  imports = [
    inputs.nvf.homeManagerModules.default
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
        wrap = false;
      };

      assistant.copilot.enable = true;
      telescope.enable = true;
      notify.nvim-notify.enable = true;
      tabline.nvimBufferline.enable = true;

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      utility = {
        vim-wakatime.enable = true;
        multicursors.enable = true;
        yazi-nvim.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          auto_clean_after_session_restore = true;
          close_if_last_window = true;
        };
      };

      autocmds = [
        {
          enable = true;
          event = ["VimEnter"];
          command = ":Neotree show";
        }
      ];
    };
  };
}
