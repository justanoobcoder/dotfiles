{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Nguyen Hong Hiep";
    userEmail = "syaorancode@gmail.com";
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
