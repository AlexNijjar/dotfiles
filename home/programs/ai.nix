let
  customInstructions = ''
    - ALWAYS CHANGE ONLY WHAT'S ABSOLUTELY NECESSARY TO MAKE CODE WORK; keep code minimal; don't refactor or add features unless explicitly asked
    - NEVER write new comments/docstrings
    - never use emojis
    - never use 'any' types in typescript EVER. if you dont know the type FIND it
    - no magic strings/numbers
    - never use shitty variable names like 'a', 'b', 'c', etc
    - avoid uncommon/confusing acronyms and abbreviations in variable/function names
    - avoid bashisms and always use posix /bin/sh in scripts
    - use rg/fd over grep/find
    - ALWAYS use zod in TS for any schema or json validation
    - when writing APIs always separate route logic from business logic and DB logic
    - always follow formatting and linting rules of the project
    - dont glaze
  '';
in
{
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
