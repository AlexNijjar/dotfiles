{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins.neogit = {
    package = pkgs.vimPlugins.neogit;
    keys = [
      {
        key = "<leader>gs";
        mode = ["n"];
        action = ":Neogit kind=floating<CR>";
        desc = "Status";
      }
      {
        key = "<leader>gc";
        mode = ["n"];
        action = ":Neogit commit<CR>";
        desc = "Commit";
      }
      {
        key = "<leader>gp";
        mode = ["n"];
        action = ":Neogit push<CR>";
        desc = "Push";
      }
      {
        key = "<leader>gf";
        mode = ["n"];
        action = ":Neogit fetch<CR>";
        desc = "Fetch";
      }
      {
        key = "<leader>gl";
        mode = ["n"];
        action = ":Neogit pull<CR>";
        desc = "Pull";
      }
      {
        key = "<leader>gb";
        mode = ["n"];
        action = ":Neogit branch<CR>";
        desc = "Branch";
      }
      {
        key = "<leader>gd";
        mode = ["n"];
        action = ":Neogit diff<CR>";
        desc = "Diff";
      }
      {
        key = "<leader>gm";
        mode = ["n"];
        action = ":Neogit merge<CR>";
        desc = "Merge";
      }
    ];
  };
}
