{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      "hf.co" = {
        hostname = "hf.co";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      tinybox = {
        hostname = "10.0.4.17";
        identityFile = "~/.ssh/AWS_MASHUP";
        user = "alex";
      };
      alex = {
        hostname = "10.0.4.2";
        identityFile = "~/.ssh/alex-arch";
        user = "alex";
      };
    };
  };
}
