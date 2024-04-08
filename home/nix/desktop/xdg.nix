{ config, ... }:

{
  xdg.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "${config.home.homeDirectory}/user/desktop";
    documents = "${config.home.homeDirectory}/user/documents";
    download = "${config.home.homeDirectory}/user/downloads";
    videos = "${config.home.homeDirectory}/user/videos";
    music = "${config.home.homeDirectory}/user/music";
    pictures = "${config.home.homeDirectory}/user/pictures";
    publicShare = "${config.home.homeDirectory}/user/public";
    templates = "${config.home.homeDirectory}/user/templates";
    extraConfig = {
      XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/screenshots";
      XDG_SCREENCAST_DIR = "${config.xdg.userDirs.videos}/screencast";
    };
  };

  xdg.configFile."mimeapps.list".force = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      let
        broswers = [ "firefox.desktop" ];
        videoPlayers = [
          "mpv.desktop"
          "umpv.desktop"
        ];
        imageViewers = [ "imv.desktop" ];
        textEditors = [ "neovide.desktop" ];
      in
      {
        "audio/mp3" = videoPlayers;
        "audio/aac" = videoPlayers;
        "audio/wav" = videoPlayers;
        "video/mp4" = videoPlayers;
        "video/mpeg" = videoPlayers;
        "image/png" = imageViewers;
        "image/jpeg" = imageViewers;
        "image/gif" = imageViewers;
        "image/webp" = imageViewers;
        "text/plain" = textEditors;
        "text/csv" = [ "wps-office-et.desktop" ];
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "wps-office-et.desktop" ];
        "application/vnd.ms-excel" = [ "wps-office-et.desktop" ];
        "application/msword" = [ "wps-office-wps.desktop" ];
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
          "wps-office-wps.desktop"
        ];
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
          "wps-office-wpp.desktop"
        ];
        "application/vnd.ms-powerpoint" = [ "wps-office-wpp.desktop" ];
        "application/pdf" = [ "wps-office-pdf.desktop" ];
        "image/svg+xml" = broswers;
        "text/html" = broswers;
      };
  };
}
