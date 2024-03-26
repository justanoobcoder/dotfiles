let
  inherit (import ../options.nix)
    hostname;
in
{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
  };
}
