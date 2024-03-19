{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./terminals.nix
    ./starship.nix
    ./fastfetch.nix
  ];
}
