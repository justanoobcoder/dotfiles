{ pkgs, config, ... }:

{
  home.file = {
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
    ".config/fcitx5" = {
      source = ./fcitx5;
      recursive = true;
    };
    ".config/fastfetch" = {
      source = ./fastfetch;
      recursive = true;
    };
    ".config/ags" = {
      source = ./ags;
      recursive = true;
    };
    ".clang-format".text = "IndentWidth: 4";
  };
}
