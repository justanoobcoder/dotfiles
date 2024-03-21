{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    p7zip

    # utils
    ripgrep
    bat
    nixpkgs-fmt

    # misc
    libnotify
    xdg-utils
    wl-clip-persist
    cliphist
  ];

  programs = {
    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
  };
}
