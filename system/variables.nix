let
  inherit (import ../options.nix) flakeDir;
in
{
  environment.variables = {
    FLAKE = "${flakeDir}";
  };
}
