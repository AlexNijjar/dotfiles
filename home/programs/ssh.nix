{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      github = {
        hostname = "github.com";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      hf = {
        hostname = "hf.co";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      tinybox = {
        hostname = "10.0.4.17";
        identityFile = "~/.ssh/alex-arch";
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
