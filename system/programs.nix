{ pkgs, inputs, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    fish.enable = true;
  };
}
