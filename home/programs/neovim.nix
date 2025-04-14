{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraLuaConfig = ''
      vim.opt.showmatch = true
      vim.opt.ignorecase = true
      vim.opt.mouse = 'a'
      vim.opt.hlsearch = true
      vim.opt.incsearch = true
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 4
      vim.opt.autoindent = true
      vim.opt.relativenumber = true
      vim.opt.wildmode = {'longest', 'list'}
      vim.opt.cursorline = true
      vim.opt.ttyfast = true
      vim.opt.clipboard = "unnamed,unnamedplus"
    '';
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      colorizer
      copilot-vim
      nerdtree
      nvim-cmp
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      telescope-nvim
      vim-nix
      which-key-nvim
    ];
  };
}
