{ pkgs, ... }:

let
  inherit (import ../../../options.nix)
    gitUsername gitEmail;
in
{
  home.packages = with pkgs; [ gh ];

  programs = {
    git = {
      enable = true;
      userName = "${gitUsername}";
      userEmail = "${gitEmail}";
    };
    lazygit = {
      enable = true;
    };
  };
}

