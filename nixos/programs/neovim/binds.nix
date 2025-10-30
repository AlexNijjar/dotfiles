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
        key = "<C-d>";
        mode = ["n"];
        action = "<C-d>zz";
        noremap = true;
        desc = "Center down";
      }
      {
        key = "<C-u>";
        mode = ["n"];
        action = "<C-u>zz";
        noremap = true;
        desc = "Center up";
      }
      {
        key = "n";
        mode = ["n"];
        action = "nzzzv";
        noremap = true;
        desc = "Next search";
      }
      {
        key = "N";
        mode = ["n"];
        action = "Nzzzv";
        noremap = true;
        desc = "Previous search";
      }
      {
        key = "G";
        mode = ["n"];
        action = "Gzz";
        noremap = true;
        desc = "Go to end of file";
      }
      {
        key = "<leader>gf";
        mode = ["n"];
        action = "<Cmd>Neogit fetch<CR>";
        noremap = true;
        desc = "Git fetch [Neogit]";
      }
      {
        key = "<leader>gb";
        mode = ["n"];
        action = "<Cmd>Neogit branch<CR>";
        noremap = true;
        desc = "Git branch [Neogit]";
      }
      {
        key = "<leader>gm";
        mode = ["n"];
        action = "<Cmd>Neogit merge<CR>";
        noremap = true;
        desc = "Git merge [Neogit]";
      }
    ];
  };
}
