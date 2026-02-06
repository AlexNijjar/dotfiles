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
  programs.claude-code = {
    enable = true;
    settings = {
      theme = "dark";
      cleanupPeriodDays = 7;
      autoUpdates = false;
      hasCompletedOnboarding = true;
      includeCoAuthoredBy = false;
      autoCompactEnabled = false;
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
          "Bash(find:*)"
          "Bash(fd:*)"
        ];
      };
    };
    memory.text = customInstructions;
  };

  programs.codex = {
    enable = true;
    custom-instructions = customInstructions;
  };
}
