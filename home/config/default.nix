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
    ".config/npm/npmrc".text = ''prefix=''${XDG_DATA_HOME}/npm
cache=''${XDG_CACHE_HOME}/npm
tmp=''${XDG_RUNTIME_DIR}/npm
init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
color=true
'';
  };
}
