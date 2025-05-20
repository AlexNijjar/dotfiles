{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins.neogit = {
    package = pkgs.vimPlugins.neogit;
    keys = [
      {
        key = "<leader>gs";
        mode = ["n"];
        action = ":Neogit<CR>";
      }
      {
        key = "<leader>gc";
        mode = ["n"];
        action = ":Neogit commit<CR>";
      }
      {
        key = "<leader>gp";
        mode = ["n"];
        action = ":Neogit push<CR>";
      }
      {
        key = "<leader>gf";
        mode = ["n"];
        action = ":Neogit fetch<CR>";
      }
      {
        key = "<leader>gl";
        mode = ["n"];
        action = ":Neogit pull<CR>";
      }
      {
        key = "<leader>gb";
        mode = ["n"];
        action = ":Neogit branch<CR>";
      }
      {
        key = "<leader>gd";
        mode = ["n"];
        action = ":Neogit diff<CR>";
      }
      {
        key = "<leader>gm";
        mode = ["n"];
        action = ":Neogit merge<CR>";
      }
    ];
  };
}
