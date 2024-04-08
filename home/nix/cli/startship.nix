{ config, ... }:

{
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[√](bold green)";
        error_symbol = "[](bold red)";
        vicmd_symbol = "[](bold green)";
      };

      add_newline = false;

      format = ''
        [┌─────────](bold green)$username$hostname
        [│](bold green)$directory$git_branch$git_status
        [└─>](bold green)$character'';

      username = {
        style_user = "yellow bold";
        style_root = "red bold";
        format = "[┤](bold green)[$user]($style)[│](bold green)";
        show_always = true;
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname](bold blue) ";
      };

      directory = {
        truncation_length = 8;
        truncation_symbol = "…/";
        home_symbol = "~";
      };

      git_branch = {
        format = "[$symbol$branch]($style) ";
        symbol = "[](bold white) ";
      };

      git_status = {
        style = "bold cyan";
        ahead = "[⇡($count)](yellow)";
        behind = "[⇣($count)](yellow)";
        untracked = "[?($count)](yellow)";
        modified = "[!($count)](red)";
        staged = "[+($count)](green)";
        renamed = "[»($count)](white)";
        deleted = "[($count)](red)";
      };
    };
  };
}
