{ pkgs, ... }:

let
  inherit (import ../options.nix)
    locale;
in
{
  i18n = {
    defaultLocale = "${locale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${locale}";
      LC_IDENTIFICATION = "${locale}";
      LC_MEASUREMENT = "${locale}";
      LC_MONETARY = "${locale}";
      LC_NAME = "${locale}";
      LC_NUMERIC = "${locale}";
      LC_PAPER = "${locale}";
      LC_TELEPHONE = "${locale}";
      LC_TIME = "${locale}";
    };
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = [ pkgs.fcitx5-bamboo ];
        waylandFrontend = true;
      };
    };
  };

}
