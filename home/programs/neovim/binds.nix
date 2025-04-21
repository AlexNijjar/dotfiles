{
  programs.nvf.settings.vim = {
    useSystemClipboard = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    keymaps = [
      {
        key = "<C-c>";
        mode = ["v"];
        action = "\"+y";
        noremap = true;
        desc = "Yank with CTRL+C";
      }
    ];
  };
}
