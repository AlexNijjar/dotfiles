{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    extraPackages = with pkgs; [
      tree-sitter
      nixd
      basedpyright
      typescript-language-server
      rust-analyzer
      lua-language-server
      bash-language-server
      yaml-language-server
      taplo
      vscode-langservers-extracted
      marksman

      nixpkgs-fmt
      ruff
      prettierd
      eslint
      eslint_d
      rustfmt
      stylua
    ];

    extraLuaConfig = ''
      vim.opt.showmatch = true
      vim.opt.ignorecase = true
      vim.opt.mouse = "a"
      vim.opt.hlsearch = true
      vim.opt.incsearch = true
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 4
      vim.opt.autoindent = true
      vim.opt.relativenumber = true
      vim.opt.wildmode = { "longest", "list" }
      vim.opt.cursorline = true
      vim.opt.ttyfast = true
      vim.opt.clipboard = "unnamedplus"
      vim.opt.endofline = true
      vim.opt.fixendofline = true
      vim.opt.spell = true
      vim.opt.spelllang = { "en_us" }

      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeMinimalUI = 1

      vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

      vim.cmd([[
        autocmd VimEnter * NERDTree | wincmd p
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
      ]])
      
      require('lualine').setup()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local servers = {
          "nixd",
          "bashls",
          "marksman",
          "basedpyright",
          "rust_analyzer",
          "lua_ls",
          "tsserver",
          "yamlls",
          "taplo",
          "jsonls",
          "cssls",
          "html",
          "ruff_lsp",
          "eslint",
      }

      for _, server in ipairs(servers) do
          lspconfig[server].setup({
              capabilities = capabilities,
          })
      end

      require("conform").setup({
          formatters_by_ft = {
              nix = { "nixpkgs_fmt" },
              python = { "ruff_format" },
              javascript = { "prettierd" },
              typescript = { "prettierd" },
              json = { "prettierd" },
              yaml = { "prettierd" },
              html = { "prettierd" },
              css = { "prettierd" },
              markdown = { "prettierd" },
              rust = { "rustfmt" },
              lua = { "stylua" },
              toml = { "taplo" },
          },
          format_on_save = {
              timeout_ms = 500,
              lsp_fallback = true,
          },
      })

      local lsp_binds = {
          { "gd", vim.lsp.buf.definition },
          { "gr", vim.lsp.buf.references },
          { "K", vim.lsp.buf.hover },
          { "<leader>rn", vim.lsp.buf.rename },
          { "<leader>ca", vim.lsp.buf.code_action },
          {
              "<leader>f",
              function()
                  require("conform").format()
              end,
          },
      }

      for _, bind in ipairs(lsp_binds) do
          vim.keymap.set("n", bind[1], bind[2], {})
      end

      local cmp = require("cmp")
      cmp.setup({
          mapping = cmp.mapping.preset.insert({
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
              ["<Tab>"] = cmp.mapping.select_next_item(),
              ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          }),
          sources = cmp.config.sources({
              { name = "nvim_lsp" },
              { name = "buffer" },
          }),
      })
      
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

      vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-n>", ":NERDTree<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true, silent = true })
      
      local neogit = require("neogit")
      vim.keymap.set("n", "<leader>gs", function() neogit.open() end, { desc = "Neogit status" })
      vim.keymap.set("n", "<leader>gc", function() neogit.open({ "commit" }) end, { desc = "Neogit commit" })
    '';
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      cmp-nvim-lsp
      cmp-buffer
      colorizer
      conform-nvim
      copilot-vim
      lualine-nvim
      nerdtree
      neogit
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
