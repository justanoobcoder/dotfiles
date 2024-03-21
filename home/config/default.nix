{ config, ... }:

let
  inherit (import ../../options.nix) flakeDir;
in
{
  home.file = {
    ".config/rofi" = {
      source =
        config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/rofi";
      recursive = true;
    };

    ".config/fcitx5" = {
      source =
        config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/fcitx5";
      recursive = true;
    };

    ".config/ags" = {
      source =
        config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/ags";
      recursive = true;
    };

    ".local/bin" = {
      source =
        config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/bin";
      recursive = true;
    };

    ".clang-format".text = "IndentWidth: 4";

    ".config/npm/npmrc".text = ''
      prefix=''${XDG_DATA_HOME}/npm
      cache=''${XDG_CACHE_HOME}/npm
      tmp=''${XDG_RUNTIME_DIR}/npm
      init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
      color=true'';
  };
}
