{pkgs, ...}: {
  programs.nvf.settings.vim = {
    syntaxHighlighting = true;
    treesitter.context.enable = true;
    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;
    comments.comment-nvim.enable = true;

    spellcheck.enable = true;

    diagnostics = {
      enable = true;
      config.virtual_text = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
      mappings.listReferences = null;

      servers = {
        ruff = {
          enable = true;
          cmd = ["${pkgs.ruff}/bin/ruff" "server"];
          filetypes = ["python"];
          root_markers = ["pyproject.toml" "ruff.toml" ".ruff.toml" ".git"];
        };

        ty = {
          enable = true;
          cmd = ["${pkgs.ty}/bin/ty" "server"];
          filetypes = ["python"];
          root_markers = ["ty.toml" "pyproject.toml" ".git"];
        };

        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all";
                includeInlayEnumMemberValueHints = true;
              };
            };
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all";
                includeInlayEnumMemberValueHints = true;
              };
            };
          };
        };

        docker_language_server = {
          enable = true;
          cmd = ["${pkgs.docker-language-server}/bin/docker-language-server" "start" "--stdio"];
          filetypes = ["dockerfile" "yaml.docker-compose"];
          root_markers = [
            "Dockerfile"
            "docker-compose.yaml"
            "docker-compose.yml"
            "compose.yaml"
            "compose.yml"
            "docker-bake.json"
            "docker-bake.hcl"
            "docker-bake.override.json"
            "docker-bake.override.hcl"
          ];
        };

        tombi = {
          enable = true;
          cmd = ["${pkgs.tombi}/bin/tombi" "lsp"];
          filetypes = ["toml"];
          root_markers = ["tombi.toml" "pyproject.toml" ".git"];
        };
      };
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      css = {
        enable = true;
        format.type = "biome";
      };
      html.enable = true;
      java.enable = true;
      kotlin = {
        enable = true;
        lsp.enable = false;
        extraDiagnostics.enable = false;
      };
      lua.enable = true;
      markdown = {
        enable = true;
        lsp.servers = ["markdown-oxide"];
        extensions.render-markdown-nvim.enable = true;
      };
      nix.enable = true;
      python = {
        enable = true;
        lsp.enable = false; # Using astral-sh/ty LSP
        format.type = "ruff";
      };
      rust.enable = true;
      sql.enable = true;
      ts = {
        enable = true;
        format.type = "biome";
      };
      yaml.enable = true;
      json.enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          kotlin = ["ktfmt"];
          dockerfile = ["dockerfmt"];
        };
        formatters = {
          ktfmt = {
            command = "${pkgs.ktfmt}/bin/ktfmt";
            args = ["$FILENAME"];
            stdin = false;
          };
          dockerfmt = {
            command = "${pkgs.dockerfmt}/bin/dockerfmt";
          };
        };
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
