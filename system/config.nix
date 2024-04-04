{
  imports = [
    ./hardware.nix # generate by `nixos-generate-config --show-hardware-config > hardware.nix`
    ./bootloader.nix
    ./network.nix
    ./timezone.nix
    ./locale.nix
    ./security.nix
    ./io.nix
    ./programs.nix
    ./services.nix
    ./users.nix
    ./logitech.nix
    ./intel-gpu.nix
    ./polkit.nix
    ./packages.nix
    ./variables.nix
  ];

  system.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  time.hardwareClockInLocalTime = true;
}
