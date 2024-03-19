{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
      ./users.nix
    ];

  system.stateVersion = "23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-pc";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = [ pkgs.fcitx5-bamboo ];
        waylandFrontend = true;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.sudo.extraRules = [
    { 
      groups = [ "wheel" ];
      commands = [
        { command = "/run/current-system/sw/bin/nvim"; options = [ "SETENV" "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/nixos-rebuild"; options = [ "SETENV" "NOPASSWD" ]; }
      ];
    }
  ];

  # values: “ondemand”, “powersave”, “performance”
  powerManagement = {
    cpuFreqGovernor = "performance";
    cpufreq = {
      min = 2700000;
      max = 2800000;
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
