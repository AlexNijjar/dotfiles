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
      {
        key = "<leader>n";
        mode = ["n"];
        action = ":Neotree toggle<CR>";
        desc = "Open Neotree";
      }
      {
        key = "<S-l>";
        mode = ["n"];
        action = ":BufferLineCycleNext<CR>";
        noremap = true;
        desc = "Next buffer";
      }
      {
        key = "<S-h>";
        mode = ["n"];
        action = ":BufferLineCyclePrev<CR>";
        noremap = true;
        desc = "Previous buffer";
      }
      {
        key = "<leader>c";
        mode = ["n"];
        action = ":Bdelete<CR>";
        noremap = true;
        desc = "Close buffer";
      }
      {
        key = "<leader>bc";
        mode = ["n"];
        action = ":BufferLineCloseOthers<CR>";
        noremap = true;
        desc = "Close other buffers";
      }
    ];
  };
}
