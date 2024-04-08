let
  inherit (import ../options.nix) keyboardLayout;
in
{
  console.keyMap = "${keyboardLayout}";
  services.xserver = {
    xkb = {
      layout = "${keyboardLayout}";
      variant = "";
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
    };
  };
}
