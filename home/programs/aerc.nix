{
  pkgs,
  config,
  ...
}: {
  programs.aerc = {
    enable = true;
    extraConfig = {
      general.unsafe-accounts-conf = true;
      viewer.pager = "${pkgs.less}/bin/less -Rc";
      filters = {
        "text/plain" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
        "text/html" = "${pkgs.aerc}/libexec/aerc/filters/html | ${pkgs.aerc}/libexec/aerc/filters/colorize";
        "text/calendar" = "${pkgs.gawk}/bin/awk -f ${pkgs.aerc}/libexec/aerc/filters/calendar";
        "message/delivery-status" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
        "message/rfc822" = "${pkgs.aerc}/libexec/aerc/filters/colorize";
        "application/pdf" = "${pkgs.zathura}/bin/zathura -";
        "audio/*" = "${pkgs.mpv}/bin/mpv -";
        "image/*" = "${pkgs.imv}/bin/imv -";
      };
      hooks = {
        mail-received = ''exec ${pkgs.libnotify}/bin/notify-send "[$AERC_ACCOUNT] mail from $AERC_FROM_NAME" "$AERC_SUBJECT"'';
      };
    };
  };

  services.mbsync.enable = true;
  programs.mbsync.enable = true;

  sops.secrets = {
    icloud_email_password = {};
    gmail_email_password = {};
  };

  accounts.email.accounts = {
    icloud = {
      primary = true;
      address = "alexander.nijjar@icloud.com";
      userName = "alexander.nijjar@icloud.com";
      realName = "Alex Nijjar";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.icloud_email_password.path}";

      imap.host = "imap.mail.me.com";
      smtp.host = "smtp.mail.me.com";

      aerc.enable = true;
      mbsync = {
        enable = true;
        create = "both";
      };
    };

    gmail = {
      address = "alexander.nijjar18@gmail.com";
      userName = "alexander.nijjar18@gmail.com";
      realName = "Alex Nijjar";
      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.gmail_email_password.path}";

      imap.host = "imap.gmail.com";
      smtp.host = "smtp.gmail.com";

      aerc.enable = true;
      mbsync = {
        enable = true;
        create = "both";
      };
    };
  };
}
