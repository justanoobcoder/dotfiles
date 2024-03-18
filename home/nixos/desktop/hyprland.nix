{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    hyprlock
    hypridle
    hyprcursor
  ];
}

