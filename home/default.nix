{ config, ... }:

let
  inherit (import ../options.nix) username flakeDir;
in
{
  imports = [
    ./nix/cli
    ./nix/dev
    ./nix/desktop
  ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  home.sessionVariables = {
    DOTFILES_DIR = "$HOME/user/work/repo/dotfiles";
    TERMINAL = "alacritty";
    BROWSER = "firefox";
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    QT4_IM_MODULE = "fcitx";
    CLUTTER_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "fcitx";
    DOCKER_CONFIG = "$HOME/.config/docker";
    MACHINE_STORAGE_PATH = "$HOME/.local/share/docker-machine";
    CARGO_HOME = "$HOME/.local/share/cargo";
    RUSTUP_HOME = "$HOME/.local/share/rustup";
    GOMODCACHE = "$HOME/.cache/go/mod";
    GRADLE_USER_HOME = "$HOME/.local/share/gradle";
    WGETRC = "$HOME/.config/wget/wgetrc";
    TERMINFO = "$HOME/.local/share/terminfo";
    TERMINFO_DIRS = "$HOME/.local/share/terminfo:/usr/share/terminfo";
    LESSHISTFILE = "-";
    NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    PATH = ''$PATH:$HOME/.local/share/npm/bin:$HOME/.local/share/go/bin:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')'';
  };

  home.file = {
    ".config/rofi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/rofi";
      recursive = true;
    };

    ".config/fcitx5" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/fcitx5";
      recursive = true;
    };

    ".config/ags" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/ags";
      recursive = true;
    };

    ".local/bin" = {
      source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/bin";
      recursive = true;
    };

    ".clang-format".text = "IndentWidth: 4";

    ".config/neovide/config.toml".text = ''
      [font]
      normal = ["JetBrainsMono Nerd Font"]
      size = 12'';

    ".config/npm/npmrc".text = ''
      prefix=''${XDG_DATA_HOME}/npm
      cache=''${XDG_CACHE_HOME}/npm
      tmp=''${XDG_RUNTIME_DIR}/npm
      init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
      color=true'';
  };
}
