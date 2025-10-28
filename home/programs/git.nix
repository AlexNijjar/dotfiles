{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Alex Nijjar";
      email = "alexander.nijjar@icloud.com";
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "~/.ssh/alex-arch.pub";
    };
    ignores = [
      ".idea**"
      "**/.venv"
      "**/node_modules"
      "*.env"
    ];
  };
}
