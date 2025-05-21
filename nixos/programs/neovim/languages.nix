{
  programs.nvf.settings.vim = {
    syntaxHighlighting = true;
    treesitter.context.enable = true;
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    comments.comment-nvim.enable = true;

    spellcheck = {
      enable = true;
      programmingWordlist.enable = true;
      extraSpellWords = {
        "en.utf-8" = [
          "nijjar"
          "wai"
          "w_ai"
          "gpu"
          "gpus"
          "adastra"
        ];
      };
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_text = true;
        virtual_lines = true;
        underline = true;
        update_in_insert = false;
        signs = true;
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
      trouble.enable = true;
      lspconfig = {
        enable = true;
        sources = {
          ruff = ''
            lspconfig.ruff.setup {
              capabilities = capabilities;
              on_attach = default_on_attach;
            }
          '';
          ty = ''
            local configs = require 'lspconfig.configs'
            configs.ty = {
              default_config = {
                cmd = {"ty", "server"};
                filetypes = {"python"};
                root_dir = lspconfig.util.root_pattern("pyproject.toml");
              }
            }
            lspconfig.ty.setup {
              capabilities = capabilities;
              on_attach = default_on_attach;
            }
          '';
        };
      };
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;

      assembly.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      go.enable = true;
      haskell.enable = true;
      html.enable = true;
      java.enable = true;
      kotlin.enable = true;
      lua.enable = true;
      markdown.enable = true;
      nix.enable = true;
      python = {
        enable = true;
        lsp.enable = false; # Using astral-sh/ty LSP
        format.type = "ruff";
      };
      rust.enable = true;
      sql.enable = true;
      ts.enable = true;
      yaml.enable = true;
      zig.enable = true;
    };

    pluginRC.nix = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nix,json,yaml,javascript,typescript",
        callback = function(opts)
          local bo = vim.bo[opts.buf]
          bo.tabstop = 2
          bo.shiftwidth = 2
          bo.softtabstop = 2
        end
      })

      vim.cmd("highlight SpellBad guisp=Green gui=undercurl")
    '';
  };
}
