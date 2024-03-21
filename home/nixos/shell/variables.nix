{ ... }:

{
  xdg.enable = true;

  home.sessionVariables = {
    DOTFILES_DIR = "$HOME/user/work/repo/dotfiles";
    TERMINAL = "alacritty";
    BROWSER = "floorp";
    DOCKER_CONFIG = "$HOME/.config/docker";
    MACHINE_STORAGE_PATH = "$HOME/.local/share/docker-machine";
    CARGO_HOME = "$HOME/.local/share/cargo";
    RUSTUP_HOME = "$HOME/.local/share/rustup";
    #GOPATH = "$HOME/.local/share/go";
    GOMODCACHE = "$HOME/.cache/go/mod";
    GRADLE_USER_HOME = "$HOME/.local/share/gradle";
    WGETRC = "$HOME/.config/wget/wgetrc";
    TERMINFO = "$HOME/.local/share/terminfo";
    TERMINFO_DIRS = "$HOME/.local/share/terminfo:/usr/share/terminfo";
    LESSHISTFILE = "-";
    NPM_CONFIG_USERCONFIG = "$HOME/.config/npm/npmrc";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    PATH = ''
      $PATH:$HOME/.local/share/npm/bin:$HOME/.local/share/go/bin:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')'';
  };
}
