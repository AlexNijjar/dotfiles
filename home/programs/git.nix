{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Alex Nijjar";
        email = "alexander.nijjar@icloud.com";
      };
      pull.rebase = true;
      rebase.autoStash = true;
      fetch.prune = true;
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      diff.colorMoved = "dimmed_zebra";
      diff.colorMovedWS = "allow-indentation-change";
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "~/.ssh/alex-arch.pub";
    };
    ignores = [
      "**/.venv"
      "**/node_modules"
      "**/dist"
      "*.env"
    ];
  };
}
