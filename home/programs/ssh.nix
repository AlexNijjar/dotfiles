{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
        addKeysToAgent = "yes";
      };
      "hf.co" = {
        hostname = "hf.co";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
        addKeysToAgent = "yes";
      };
      tinybox = {
        hostname = "10.0.4.17";
        identityFile = "~/.ssh/AWS_MASHUP";
        user = "alex";
        addKeysToAgent = "yes";
      };
      alex = {
        hostname = "10.0.4.2";
        identityFile = "~/.ssh/alex-arch";
        user = "alex";
        addKeysToAgent = "yes";
      };
    };
  };
}
