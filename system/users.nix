{ pkgs, ... }:

{
  users.users.hiepnh = {
    isNormalUser = true;
    description = "Nguyen Hong Hiep";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" "power" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      fish
    ];
  };
}
