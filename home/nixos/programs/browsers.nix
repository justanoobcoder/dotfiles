{ pkgs, ... }:

{
  home.packages = with pkgs; [
    floorp
    microsoft-edge
  ];
}


