{ pkgs, ... }:

{
  programs = {
    neovim = {
      defaultEditor = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    fish.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
