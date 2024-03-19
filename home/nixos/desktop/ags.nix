{ inputs, pkgs, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs = {
    ags = {
      enable = true;

      # null or path, leave as null if you don't want hm to manage the config
      #configDir = ../ags;
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
