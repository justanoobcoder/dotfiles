{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    liberation_ttf
    font-awesome
    comic-mono
  ];
}

