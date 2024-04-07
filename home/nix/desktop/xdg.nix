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
  };

  xdg.mimeApps.enable = true;

  xdg.mimeApps.defaultApplications = {
    "audio/mp3" = [ "mpv.desktop" "umpv.desktop" ];
    "audio/aac" = [ "mpv.desktop" "umpv.desktop" ];
    "audio/wav" = [ "mpv.desktop" "umpv.desktop" ];
    "video/mp4" = [ "mpv.desktop" "umpv.desktop" ];
    "video/mpeg" = [ "mpv.desktop" "umpv.desktop" ];
    "image/png" = [ "imv.desktop" ];
    "image/jpeg" = [ "imv.desktop" ];
    "image/gif" = [ "imv.desktop" ];
    "image/webp" = [ "imv.desktop" ];
    "text/plain" = [ "nvim.desktop" ];
    "text/csv" = [ "wps-office-et.desktop" ];
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "wps-office-et.desktop" ];
    "application/vnd.ms-excel" = [ "wps-office-et.desktop" ];
    "application/msword" = [ "wps-office-wps.desktop" ];
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "wps-office-wps.desktop" ];
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "wps-office-wpp.desktop" ];
    "application/vnd.ms-powerpoint" = [ "wps-office-wpp.desktop" ];
    "application/pdf" = [ "wps-office-pdf.desktop" ];
    "image/svg+xml" = [ "firefox.desktop" ];
    "text/html" = [ "firefox.desktop" ];
  };
}
