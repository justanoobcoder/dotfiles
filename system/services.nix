{ ... }:

{
  services = {
    openssh.enable = true;
    desktopManager.plasma6.enable = true;
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

  systemd.services.warp-svc = {
    description = "Cloudflare WARP";
    serviceConfig = {
      Type = "exec";
      ExecStart = "/run/current-system/sw/bin/warp-svc";
      ExecStop = "pkill warp-svc";
      Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
  };
  systemd.services.warp-svc.enable = true;
}
