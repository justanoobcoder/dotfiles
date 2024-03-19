{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    nodejs_21
    bun
    power-profiles-daemon
    cloudflare-warp
  ];

}
