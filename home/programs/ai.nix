let
  customInstructions = ''
    - Always search up the latest documentation when working with libraries/APIs,
      never make assumptions.
    - Always use zod for schema validation.
    - Avoid unnecessary code duplication/redundancy.
    - When writing backends keep backend routes barebones with business logic in separate service files.
    - Never use `any` types, always use proper types.
    - Never use type casts
    - Never use emojis.
    - Never write new comments/docstrings.
    - Only log when necessary.
    - Avoid magic strings/numbers when applicable.
    - avoid bashisms and always use posix /bin/sh in scripts
    - use rg/fd over grep/find
    - Avoid shitty variable names like 'a', 'b' and confusing/non-standard acronyms.
    - dont glaze
  '';
in {
  programs = {
    claude-code = {
      enable = true;
      settings = {
        theme = "dark";
        cleanupPeriodDays = 7;
        autoUpdates = false;
        hasCompletedOnboarding = true;
        includeCoAuthoredBy = false;
        verbose = true;
        permissions = {
          allow = [
            "Bash(git status:*)"
            "Bash(git log:*)"
            "Bash(git diff:*)"
            "Bash(pwd)"
            "Bash(echo:*)"
            "Bash(which:*)"
            "Bash(wc:*)"
            "Bash(tree:*)"
            "Bash(file:*)"
            "Bash(codex review:*)"
            "Bash(codex exec:*)"
            "Bash(gemini:*)"
          ];
        };
      };
      memory.text =
        customInstructions
        + ''
          - You have access to Codex (OpenAI) and Gemini (Google) CLIs as
            read-only reviewers. After implementing features or significant
            changes, consult both for review before presenting the final result.
            Skip this for trivial changes. Always run codex and gemini as
            separate Bash calls, never combine them in one shell command.
            When reviewing diffs, only include relevant source files -- exclude
            lockfiles, generated code, and other noise. After collecting
            results, summarize findings and assess what's valid vs noise.
            - `codex review --uncommitted` for reviewing uncommitted changes
            - `codex review --base main` for reviewing against main
            - `codex exec --sandbox read-only "prompt"` for general questions
            - `gemini -p "prompt"` for general questions. Always include
              "Do NOT use any tools." in the prompt. For reviewing diffs, pipe
              via stdin: `git diff | gemini -p "Review the above diff. Do NOT use any tools." -o text`
        '';
    };

    codex = {
      enable = true;
      custom-instructions = customInstructions;
    };

    gemini-cli = {
      enable = true;
      context.GEMINI = customInstructions;
      settings = {
        general = {
          preferredEditor = "nvim";
          vimMode = true;
          enableAutoUpdate = false;
          enableAutoUpdateNotification = false;
          checkpointing.enabled = true;
          previewFeatures = true;
        };
        privacy.usageStatisticsEnabled = false;
        security.auth.selectedType = "oauth-personal";
      };
    };
  };
}
