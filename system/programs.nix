{ pkgs, inputs, ... }:

{
  programs = {
    neovim = { defaultEditor = true; };
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fish.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
