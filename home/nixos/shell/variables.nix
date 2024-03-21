{ ... }:

{
  home.sessionVariables = {
    DOTFILES_DIR = "$HOME/user/work/repo/dotfiles";
    TERMINAL = "alacritty";
    BROWSER = "floorp";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    DOCKER_CONFIG = "$XDG_CONFIG_HOME/docker";
    MACHINE_STORAGE_PATH = "$XDG_DATA_HOME/docker-machine";
    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
    GOPATH = "$XDG_DATA_HOME/go";
    GOMODCACHE = "$XDG_CACHE_HOME/go/mod";
    GRADLE_USER_HOME = "$XDG_DATA_HOME/gradle";
    WGETRC = "$XDG_CONFIG_HOME/wget/wgetrc";
    TERMINFO = "$XDG_DATA_HOME/terminfo";
    TERMINFO_DIRS = "$XDG_DATA_HOME/terminfo:/usr/share/terminfo";
    LESSHISTFILE = "-";
    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    PATH = ''
      $PATH:$HOME/.local/share/npm/bin:$HOME/.local/share/go/bin:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')'';
  };
}
