{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    fastfetch
  ];

  programs = {
    eza = {
      enable = true;
      extraOptions = [ "--group-directories-first" ];
    };
    zoxide = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
  };
}
