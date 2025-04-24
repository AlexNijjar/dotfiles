{
  programs.thunderbird = {
    enable = true;
    profiles.default.isDefault = true;
  };

  accounts.email.accounts = {
    "icloud" = {
      primary = true;
      address = "alexander.nijjar@icloud.com";
      realName = "Alex Nijjar";
      thunderbird.enable = true;
    };
    "gmail" = {
      address = "alexander.nijjar18@gmail.com";
      realName = "Alex Nijjar";
      thunderbird.enable = true;
    };
    "wombo" = {
      address = "alexander@wombo.ai";
      realName = "Alex Nijjar";
      thunderbird.enable = true;
    };
    "terrarium" = {
      address = "alex@terrarium.earth";
      realName = "Alex Nijjar";
      thunderbird.enable = true;
    };
  };
}
