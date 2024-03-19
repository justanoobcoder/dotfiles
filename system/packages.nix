{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    neovim
    nodejs_21
    power-profiles-daemon
    cloudflare-warp
  ];

}
