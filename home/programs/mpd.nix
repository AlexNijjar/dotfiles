{
  services = {
    mpd-mpris.enable = true;
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type  "pipewire"
          name  "PipeWire Sound Server"
        }
      '';
    };
  };
}
