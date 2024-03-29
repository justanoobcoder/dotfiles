{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
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
    linux-wifi-hotspot
    wifi-qr
    luajitPackages.jsregexp
    python3
    python311Packages.pip
    lua
    luajitPackages.luarocks
  ];
}
