{
  security = {
    rtkit.enable = true;

    sudo.enable = false;
    sudo-rs = {
      enable = true;
      extraConfig = ''
        Defaults timestamp_timeout=60
      '';
    };

    pam.services.hyprlock = {};

    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (subject.isInGroup("wheel") && (
            action.id == "org.freedesktop.login1.suspend" ||
            action.id == "org.freedesktop.login1.suspend-multiple-sessions" ||
            action.id == "org.freedesktop.login1.hibernate" ||
            action.id == "org.freedesktop.login1.hibernate-multiple-sessions"
          )) {
            return polkit.Result.YES;
          }
        });
      '';
    };
  };
}
