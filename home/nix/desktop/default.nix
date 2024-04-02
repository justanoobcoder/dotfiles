{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./ags.nix
    ./themes.nix
    ./fonts.nix
    ./xdg.nix
    ./browsers.nix
    ./media.nix
  ];

  home.packages = with pkgs; [
    rofi-wayland
    webcord
    wpsoffice
    gnome.nautilus
    showmethekey
    udiskie
  ];
}
