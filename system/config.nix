{ pkgs, ... }:

let
  inherit (import ../options.nix)
    hostname timezone locale keyboardLayout flakeDir;
in
{
  imports = [
    ./hardware.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./users.nix
    ./logitech.nix
    ./intel-gpu.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${hostname}";
  networking.networkmanager.enable = true;

  time.timeZone = "${timezone}";

  i18n = {
    defaultLocale = "${locale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${locale}";
      LC_IDENTIFICATION = "${locale}";
      LC_MEASUREMENT = "${locale}";
      LC_MONETARY = "${locale}";
      LC_NAME = "${locale}";
      LC_NUMERIC = "${locale}";
      LC_PAPER = "${locale}";
      LC_TELEPHONE = "${locale}";
      LC_TIME = "${locale}";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = [ pkgs.fcitx5-bamboo ];
        waylandFrontend = true;
      };
    };
  };

  console.keyMap = "${keyboardLayout}";
  services.xserver = {
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
  };

  nixpkgs.config.allowUnfree = true;

  security.sudo.extraRules = [{
    groups = [ "wheel" ];
    commands = [
      {
        command = "/run/current-system/sw/bin/nvim";
        options = [ "SETENV" "NOPASSWD" ];
      }
      {
        command = "/run/current-system/sw/bin/nixos-rebuild";
        options = [ "SETENV" "NOPASSWD" ];
      }
    ];
  }];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

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

  environment.variables = {
    FLAKE = "${flakeDir}";
    POLKIT_BIN =
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
