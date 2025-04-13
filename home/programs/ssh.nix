{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      github = {
        host = "github.com";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      hf = {
        host = "hf.co";
        identityFile = "~/.ssh/alex-arch";
        user = "git";
      };
      tinybox = {
        host = "10.0.4.17";
        identityFile = "~/.ssh/alex-arch";
        user = "alex";
      };
      alex = {
        host = "10.0.4.2";
        identityFile = "~/.ssh/alex-arch";
        user = "alex";
      };
    };
  };
}
