{
  programs.nvf.settings.vim = {
    lineNumberMode = "relative";

    statusline = {
      lualine = {
        enable = true;
        theme = "catppuccin";
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };

    visuals = {
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      nvim-cursorline.enable = true;
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
      rainbow-delimiters.enable = true;
      tiny-devicons-auto-colors.enable = true;
    };
  };
}
