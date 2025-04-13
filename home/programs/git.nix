{
  programs.git = {
    enable = true;
    userName = "Alex Nijjar";
    userEmail = "alexander.nijjar@icloud.com";
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "/home/alex/.ssh/alex-arch.pub";
    };
    ignores = [
      ".idea**"
      "**/.venv"
      "**/node_modules"
      "*.env"
    ];
  };
}
