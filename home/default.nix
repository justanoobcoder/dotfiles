{ ... }:

let inherit (import ../options.nix) username;
in {
  imports = [ ./nixos/programs ./nixos/shell ./nixos/desktop ./config ];

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
