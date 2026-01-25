{
  pkgs,
  inputs,
  ...
}: {
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
          cmd = [
            "${pkgs.biome}/bin/biome"
            "lsp-proxy"
          ];
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
          cmd = [
            "${pkgs.docker-language-server}/bin/docker-language-server"
            "start"
            "--stdio"
          ];
          filetypes = [
            "dockerfile"
            "yaml.docker-compose"
          ];
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
      };
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      bash.enable = true;
      css = {
        enable = true;
        format.type = ["biome"];
      };
      html.enable = true;
      java = {
        enable = true;
        lsp.enable = false;
      };
      kotlin = {
        enable = true;
        lsp.enable = false;
        extraDiagnostics.enable = false;
      };
      lua.enable = true;
      markdown = {
        enable = true;
        lsp.servers = ["rumdl"];
        extensions.render-markdown-nvim.enable = true;
      };
      nix.enable = true;
      python = {
        enable = true;
        lsp.servers = ["ruff" "ty"];
        format.type = ["ruff"];
      };
      rust.enable = true;
      sql = {
        enable = true;
        format.type = ["sqruff"];
        dialect = "postgres";
      };
      toml.enable = true;
      ts = {
        enable = true;
        format.type = ["biome"];
        extraDiagnostics.enable = false; # Not using eslint
      };
      yaml.enable = true;
      json.enable = true;
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          javascript = [
            "biome"
            "biome-organize-imports"
          ];
          javascriptreact = [
            "biome"
            "biome-organize-imports"
          ];
          typescript = [
            "biome"
            "biome-organize-imports"
          ];
          typescriptreact = [
            "biome"
            "biome-organize-imports"
          ];
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

    extraPlugins = {
      kotlin-nvim = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = "kotlin.nvim";
          version = "unstable";
          src = inputs.kotlin-nvim;
        };
        setup = ''
          require("kotlin").setup({
            root_markers = { "gradlew", ".git", "mvnw", "settings.gradle", "settings.gradle.kts" },
          })
        '';
      };
      nvim-jdtls = {
        package = pkgs.vimPlugins.nvim-jdtls;
        setup = ''
          local function start_jdtls()
            local root_markers = { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts" }
            local root_dir = vim.fs.root(0, root_markers)
            local existing_client = vim.lsp.get_clients({ name = "jdtls" })[1]

            if existing_client and not vim.lsp.get_clients({ bufnr = 0, name = "jdtls" })[1] then
              vim.lsp.buf_attach_client(0, existing_client.id)
              return
            end

            if not root_dir then
              return
            end

            require("jdtls").start_or_attach({
              cmd = { "${pkgs.jdt-language-server}/bin/jdtls" },
              root_dir = root_dir,
              settings = {
                java = {
                  configuration = {
                    runtimes = {
                      { name = "JavaSE-25", path = "${pkgs.javaPackages.compiler.openjdk25}/lib/openjdk", default = true },
                    },
                  },
                },
              },
            })
          end

          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java", "kotlin" },
            callback = start_jdtls,
          })
        '';
      };
    };
  };
}
