{ pkgs, ... }:

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

      vim.cmd([[
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
      ]])
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
      vim-commentary
      vim-nix
      vim-wakatime
      which-key-nvim
    ];
  };
}
