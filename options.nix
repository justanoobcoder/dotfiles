let
  username = "hiepnh";
  fullname = "Nguyen Hong Hiep";
  hostname = "nixos-pc";
in
{
  username = "${username}";
  fullname = "${fullname}";
  hostname = "${hostname}";
  # run `mkpasswd -m sha-512 yourpassword` to generate the hashed password
  hashedPassword =
    "$6$oZdux9tYWX4C5UvT$AS91kxEq43FPPZX/In289dgVIo6NYphArKDt5QhGMABaiS8XsO8uq/JLvHxkXKvNLe471R3ZPdL52CXMkQU5B.";
  gitUsername = "${fullname}";
  gitEmail = "syaorancode@gmail.com";
  flakeDir = "/home/${username}/.dotfiles";
  locale = "en_US.UTF-8";
  keyboardLayout = "us";
  timezone = "Asia/Ho_Chi_Minh";
  shell = "fish";
  gpu = "intel";
  logitech = true;
}
