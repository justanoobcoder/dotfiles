{ pkgs, ... }:

let
  inherit (import ../options.nix)
  username gitUsername shell hashedPassword;
in
{
  users.mutableUsers = true;
  users.users."${username}" = {
    isNormalUser = true;
    homeMode = "755";
    hashedPassword = "${hashedPassword}"
    description = "${gitUsername}";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" "power" "docker" ];
    shell = pkgs."${shell}";
    packages = [];
  };
}
