{ config, pkgs, ... }:

{
  imports = [
    ./variables.nix
    ./common.nix
    ./terminals.nix
    ./starship.nix
    ./fastfetch.nix
    ./fish.nix
  ];
}
