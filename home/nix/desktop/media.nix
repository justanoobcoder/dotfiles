{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wireplumber
    imv
    flameshot
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };

    obs-studio.enable = true;
  };
}
