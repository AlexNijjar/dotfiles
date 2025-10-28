{
  programs.nvf.settings.vim = {
    lineNumberMode = "relNumber";

    statusline.lualine.enable = true;

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };

    visuals = {
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      nvim-cursorline.enable = true;
      rainbow-delimiters.enable = true;
    };
  };
}
