{ pkgs, ... }:

let
  inherit (import ../options.nix)
    username fullname hashedPassword;
in
{
  users.mutableUsers = true;
  users.users.${username} = {
    isNormalUser = true;
    homeMode = "755";
    hashedPassword = "${hashedPassword}";
    description = "${fullname}";
    extraGroups =
      [ "networkmanager" "wheel" "video" "audio" "storage" "power" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [ flatpak ];
  };
}
