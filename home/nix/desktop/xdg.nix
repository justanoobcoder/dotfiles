{ config, ... }:

{
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
}
