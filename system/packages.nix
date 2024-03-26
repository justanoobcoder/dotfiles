{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    power-profiles-daemon
    cloudflare-warp
    zip
    unzip
    unrar
    p7zip
    ripgrep
    bat
    nixpkgs-fmt
    udiskie
    libnotify
    xdg-utils
    wl-clip-persist
    cliphist
  ];
}
