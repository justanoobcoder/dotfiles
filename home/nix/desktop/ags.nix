{ inputs, pkgs, ... }:

{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs = {
    ags = {
      enable = true;
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };

  # ags dependencies
  home.packages = with pkgs; [
    bun
    swww
    dart-sass
    fd
    brightnessctl
    hyprpicker
    slurp
    grim
    wl-clipboard
    wayshot
    swappy
    pavucontrol
  ];
}
