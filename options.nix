let
  username = "hiepnh";
  hostname = "nixos-pc";
in {
  # User settings
  username = "${username}";
  hostname = "${hostname}";
  hashedPassword = "$6$oZdux9tYWX4C5UvT$AS91kxEq43FPPZX/In289dgVIo6NYphArKDt5QhGMABaiS8XsO8uq/JLvHxkXKvNLe471R3ZPdL52CXMkQU5B.";
  gitUsername = "Nguyen Hong Hiep";
  gitEmail = "syaorancode@gmail.com";
  flakeDir = "/home/${username}/.dotfiles";

  # System settings
  locale = "en_US.UTF-8";
  keyboardLayout = "us";
  timezone = "Asia/Ho_Chi_Minh";
  shell = "fish";
  gpu = "intel";

  # Enable Support For
  # Logitech Devices
  logitech = true;
}
