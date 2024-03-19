{ config, pkgs, ... }:

{
  imports = [
    ./ags.nix
    ./gtk-qt.nix
    ./hyprland.nix
    ./common.nix
    ./fonts.nix
    ./user-dirs.nix
  ];
}
