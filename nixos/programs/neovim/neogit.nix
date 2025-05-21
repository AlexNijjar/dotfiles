{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins.neogit = {
    package = pkgs.vimPlugins.neogit;
    keys = [
      {
        key = "<leader>gs";
        mode = ["n"];
        action = ":Neogit kind=floating<CR>";
        description = "Status";
      }
      {
        key = "<leader>gc";
        mode = ["n"];
        action = ":Neogit commit<CR>";
        description = "Commit";
      }
      {
        key = "<leader>gp";
        mode = ["n"];
        action = ":Neogit push<CR>";
        description = "Push";
      }
      {
        key = "<leader>gf";
        mode = ["n"];
        action = ":Neogit fetch<CR>";
        description = "Fetch";
      }
      {
        key = "<leader>gl";
        mode = ["n"];
        action = ":Neogit pull<CR>";
        description = "Pull";
      }
      {
        key = "<leader>gb";
        mode = ["n"];
        action = ":Neogit branch<CR>";
        description = "Branch";
      }
      {
        key = "<leader>gd";
        mode = ["n"];
        action = ":Neogit diff<CR>";
        description = "Diff";
      }
      {
        key = "<leader>gm";
        mode = ["n"];
        action = ":Neogit merge<CR>";
        description = "Merge";
      }
    ];
  };
}
