{ pkgs, ... }:

let
  inherit (import ../../../options.nix)
  hostname flakeDir;
in
{
  home.packages = with pkgs; [
    fishPlugins.fzf-fish
  ];

  programs.fish = {
    enable = true;
    loginShellInit = ''if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      exec Hyprland
    end'';
    shellAliases = {
      ud = "sudo nixos-rebuild switch --flake ${flakeDir}#${hostname}";
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
    fzf_configure_bindings --history=\ch --processes=\cp'';
    shellInitLast = ''fastfetch'';
    functions = {
      frepo = ''
      set repodir $HOME/user/work/repo
      cd $repodir
      cd (ls $repodir | fzf --layout=reverse --height 40% --border || echo .)'';

      cfh = ''
      set file (find ${flakeDir}/home/config/hypr -type f | fzf --layout=reverse --height 40% --border)
      [ -z "$file" ] || $EDITOR $file'';

      mcd = "mkdir -p $argv[1] && cd $argv[1]";

      fb = ''
      set file (find ${flakeDir}/home/config/bin -type f | fzf --layout=reverse --height 40% --border)
      [ -z "$file" ] || $EDITOR $file'';
    };
  };
}
