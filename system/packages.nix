{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnumake
    cmake
    wget
    power-profiles-daemon
    cloudflare-warp
    zip
    unzip
    unrar
    p7zip
    patchelf
    ntfs3g
    ripgrep
    bat
    bc
    gum
    nixpkgs-fmt
    libnotify
    glib
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
    gcc
    amber-lang
  ];


  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

}
