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
      config.virtual_lines = true;
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
          kotlin_language_server = lib.mkForce ''
            lspconfig.kotlin_language_server.setup {
              capabilities = capabilities,
              root_dir = lspconfig.util.root_pattern("build.gradle.kts", "settings.gradle.kts"),
              on_attach = default_on_attach,
              cmd = {"${pkgs.kotlin-language-server}/bin/kotlin-language-server"},
              init_options = {
                storagePath = vim.fn.stdpath('state') .. '/kotlin',
              },
              settings = {
                kotlin = {
                  externalSources = {
                    useKlsScheme = true,
                    autoConvertToKotlin = true
                  }
                }
              },
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
