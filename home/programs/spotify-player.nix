{
  programs.spotify-player = {
    enable = true;
    settings = {
      device = {
        volume = 100;
        autoplay = true;
        audio_cache = true;
      };
      layout.library = {
        album_percent = 0;
      };
    };
  };
}
