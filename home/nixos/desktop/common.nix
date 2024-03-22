{ pkgs, ... }:

{
  home.packages = with pkgs; [ rofi-wayland webcord wpsoffice showmethekey ];
}
