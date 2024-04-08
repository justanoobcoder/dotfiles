{ lib, ... }:

let
  inherit (import ../options.nix) logitech;
in
lib.mkIf (logitech == true) {
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };
}
