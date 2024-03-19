{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fishPlugins.fzf-fish
  ];

  programs.fish = {
    enable = true;
    loginShellInit = ''exec Hyprland'';
    shellAliases = {
      ls = "eza --group-directories-first";
      ll = "eza -lbg --icons";
      la = "eza -a";
      lla = "eza -lbag --icons";
      cl = "clear";
      v = "nvim";
      sv = "sudoedit";
      grep = "grep --color=always";
      fgrep = "fgrep --color=always";
      egrep = "egrep --color=always";
      sd = "shutdown -h now";
      rb = "shutdown -r now";
      g = "lazygit";
      wget = "wget --hsts-file $XDG_CACHE_HOME/wget-hsts";
      yarn = "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config";
    };
    interactiveShellInit = ''set fish_greeting
    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_visual block
    fzf_configure_bindings --history=\ch --processes=\cp
    '';
    shellInitLast = ''fastfetch'';
    functions = {
      frepo = ''
      set repodir $HOME/user/work/repo
      cd $repodir
      cd (ls $repodir | fzf --layout=reverse --height 40% --border || echo .)
      '';
    };
  };
}
