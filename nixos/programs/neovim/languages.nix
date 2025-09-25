{
  pkgs,
  lib,
  ...
}: {
  programs.nvf.settings.vim = {
    syntaxHighlighting = true;
    treesitter.context.enable = true;
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    comments.comment-nvim.enable = true;

    spellcheck = {
      enable = true;
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
      config.virtual_text = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
      mappings = {
        listReferences = null;
        goToDefinition = null;
        listImplementations = null;
        goToType = null;
      };
      lspconfig = {
        enable = true;
        sources = {
          ruff = ''
            lspconfig.ruff.setup {
              capabilities = capabilities;
              on_attach = default_on_attach;
            }
          '';
          # SOURCE: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/ty.lua
          # TODO: Remove once lspconfig is updated
          ty = ''
            local configs = require 'lspconfig.configs'
            configs.ty = {
              default_config = {
                cmd = {"ty", "server"};
                filetypes = {"python"};
                root_dir = lspconfig.util.root_pattern("ty.toml", "pyproject.toml", ".git");
              }
            }
            lspconfig.ty.setup {
              capabilities = capabilities;
              on_attach = default_on_attach;
            }
          '';
          # SOURCE: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/kotlin_lsp.lua
          # TODO: Remove once lspconfig is updated
          # TODO: Remove hardcoded path when nixpkgs adds kotlin-lsp
          kotlin_lsp = ''
            local configs = require 'lspconfig.configs'
            configs.kotlin_lsp = {
              default_config = {
                filetypes = { 'kotlin' },
                cmd = { '/home/alex/Downloads/kotlin-lsp.sh', '--stdio' },
                root_dir = lspconfig.util.root_pattern(
                  'build.gradle',
                  'build.gradle.kts',
                  'settings.gradle',
                  'settings.gradle.kts',
                  'pom.xml',
                  'workspace.json'
                ),
              }
            }
            lspconfig.kotlin_lsp.setup {
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
      enableExtraDiagnostics = true;

      assembly.enable = true;
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      go.enable = true;
      haskell.enable = true;
      html.enable = true;
      java.enable = true;
      kotlin = {
        enable = true;
        lsp.enable = false; # Using kotlin-lsp
        extraDiagnostics.enable = false; # Using ktfmt
      };
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

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft.kotlin = ["ktfmt"];
        formatters.ktfmt = {
          command = "${pkgs.ktfmt}/bin/ktfmt";
          args = ["$FILENAME"];
          stdin = false;
        };
      };
    };

    diagnostics.nvim-lint = {
      enable = true;
      linters_by_ft.kotlin = ["detekt"];
      linters.detekt = {
        cmd = "${pkgs.detekt}/bin/detekt";
        args = [
          "--input"
          "%filepath"
          "--report"
          "plain:stdout"
        ];
        ignore_exitcode = true;
        parser = lib.generators.mkLuaInline ''
          require('lint.parser').from_pattern(
            '(.+):(%d+):(%d+): (.+): (.+)',
            { 'file', 'lnum', 'col', 'severity', 'message' },
            { error = 'error', warning = 'warn', info = 'info' }
          )
        '';
      };
    };

    pluginRC.nix = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nix,json,yaml,javascript,typescript,sh,kt,kts",
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
