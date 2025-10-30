{pkgs, ...}: {
  programs.nvf.settings.vim = {
    syntaxHighlighting = true;
    treesitter.context.enable = true;
    treesitter.textobjects = {
      enable = true;
      setupOpts = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@assignment.outer";
            "ia" = "@assignment.inner";
          };
        };
      };
    };
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

        biome = {
          enable = true;
          cmd = ["${pkgs.biome}/bin/biome" "lsp-proxy"];
          filetypes = [
            "astro"
            "css"
            "graphql"
            "html"
            "javascript"
            "javascriptreact"
            "json"
            "jsonc"
            "svelte"
            "typescript"
            "typescript.tsx"
            "typescriptreact"
            "vue"
          ];
          root_markers = [
            "package-lock.json"
            "yarn.lock"
            "pnpm-lock.yaml"
            "bun.lockb"
            "bun.lock"
            ".git"
          ];
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
      sql = {
        enable = false; # busted atm
        dialect = "postgres";
      };
      ts = {
        enable = true;
        format.type = "biome";
        extraDiagnostics.enable = false; # Not using eslint
      };
      yaml.enable = true;
      json.enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          javascript = ["biome" "biome-organize-imports"];
          javascriptreact = ["biome" "biome-organize-imports"];
          typescript = ["biome" "biome-organize-imports"];
          typescriptreact = ["biome" "biome-organize-imports"];
          json = ["biome"];
          jsonc = ["biome"];

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
