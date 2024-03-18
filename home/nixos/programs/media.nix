{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    wireplumber
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      scripts = [pkgs.mpvScripts.mpris];
    };

    obs-studio.enable = true;
  };
}
