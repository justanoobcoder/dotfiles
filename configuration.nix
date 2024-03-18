# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-pc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  services = {
    openssh.enable = true;
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              esc = "capslock";
            };
          };
        };
      };
    };
    power-profiles-daemon.enable = true;
    blueman.enable = true;
    upower.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.hiepnh = {
    isNormalUser = true;
    description = "Nguyen Hong Hiep";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "storage" "power" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      fish
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    nodejs_21
    bun
    power-profiles-daemon
    cloudflare-warp
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  ### Custom configuration ###

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    neovim = {
      defaultEditor = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    fish.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };

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

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-bamboo
    ];
    fcitx5.waylandFrontend = true;
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
