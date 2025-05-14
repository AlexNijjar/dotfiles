{
  programs.nvf.settings.vim = {
    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
      hardtime-nvim.enable = true;
    };

    keymaps = [
      {
        key = "<C-c>";
        mode = ["v"];
        action = "\"+y";
        noremap = true;
        desc = "Yank with CTRL+C";
      }
      {
        key = "<C-n>";
        mode = ["n"];
        action = ":bnext<CR>";
        noremap = true;
        desc = "Next buffer";
      }
      {
        key = "<C-p>";
        mode = ["n"];
        action = ":bprevious<CR>";
        noremap = true;
        desc = "Previous buffer";
      }
    ];
  };
}
