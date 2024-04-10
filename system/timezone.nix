let
  inherit (import ../options.nix) timezone;
in
{
  time.timeZone = "${timezone}";
}
