let
  username = "hiepnh";
  hostname = "nixos-pc";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/.dotfiles";
in {
  # User settings
  username = "hiepnh";
  hostname = "nixos-pc";
  gitUsername = "Nguyen Hong Hiep";
  gitEmail = "syaorancode@gmail.com";
  browser = "floorp";
  flakeDir = "${flakeDir}";
  terminal = "alacritty";

  # System settings
  locale = "en_US.UTF-8";
  keyboardLayout = "us";
  timezone = "Asia/Ho_Chi_Minh";
  shell = "fish";
  theKernel = "lastest";

  # Enable Support For
  # Logitech Devices
  logitech = true;

  # Enable Terminals
  alacritty = true;

  # Enable SyncThing
  syncthing = false;
}
