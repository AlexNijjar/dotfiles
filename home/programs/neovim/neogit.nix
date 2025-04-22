{pkgs, ...}: {
  programs.nvf.settings.vim.lazy.plugins = {
    "neogit" = {
      package = pkgs.vimPlugins.neogit;
      keys = [
        {
          mode = ["n"];
          key = "<leader>gs";
          action = ":Neogit<CR>";
        }
        {
          mode = ["n"];
          key = "<leader>gc";
          action = ":Neogit commit<CR>";
        }
        {
          mode = ["n"];
          key = "<leader>gp";
          action = ":Neogit push<CR>";
        }
        {
          mode = ["n"];
          key = "<leader>gf";
          action = ":Neogit fetch<CR>";
        }
        {
          mode = ["n"];
          key = "<leader>gl";
          action = ":Neogit pull<CR>";
        }
        {
          mode = ["n"];
          key = "<leader>gb";
          action = ":Neogit branch<CR>";
        }
      ];
    };
  };
}
