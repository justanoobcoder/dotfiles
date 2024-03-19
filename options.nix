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
  flakeDir = "${flakeDir}";

  # System settings
  locale = "en_US.UTF-8";
  keyboardLayout = "us";
  timezone = "Asia/Ho_Chi_Minh";
  shell = "fish";

  # Enable Support For
  # Logitech Devices
  logitech = true;
}
