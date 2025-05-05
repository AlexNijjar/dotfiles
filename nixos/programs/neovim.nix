{inputs, ...}: {
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
      };

      assistant.copilot = {
        enable = true;
        cmp.enable = true;
      };

      telescope.enable = true;
      notify.nvim-notify.enable = true;
      terminal.toggleterm.enable = true;

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      utility = {
        vim-wakatime.enable = true;
        multicursors.enable = true;
        yazi-nvim.enable = true;
      };

      navigation.harpoon.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
      };
    };
  };
}
