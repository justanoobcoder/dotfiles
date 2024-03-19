{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprlock
    hypridle
    hyprcursor
  ];
}
