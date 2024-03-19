{ pkgs, ... }:

let
  inherit (import ../options.nix)
  keyboardLayout;
in
{
  services = {
    openssh.enable = true;
    xserver = {
      xkb = {
        layout = "${keyboardLayout}";
        variant = "";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              esc = "capslock";
            };
          };
        };
      };
    };
    power-profiles-daemon.enable = true;
    blueman.enable = true;
    upower.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
  };
}
