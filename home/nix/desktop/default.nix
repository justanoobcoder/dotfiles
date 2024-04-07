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
    qt5.full
    qt5.qttools
    qt5.qtsvg
    qt5.qtbase
    rofi-wayland
    webcord
    wpsoffice
    gnome.nautilus
    showmethekey
    udiskie
  ];
}
