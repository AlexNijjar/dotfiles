{
  security = {
    sudo.extraConfig = ''
      Defaults timestamp_timeout=60
      Defaults timestamp_type=global
    '';
    sudo.wheelNeedsPassword = false;

    pam.services = {
      greetd.enableGnomeKeyring = true;
      hyprlock = {};
    };

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
