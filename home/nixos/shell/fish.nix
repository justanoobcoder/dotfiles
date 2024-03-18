{
  pkgs,
  config,
  ...
}: {
  programs = {
    fish = {
      shellAliases = {
        ls = "eza --group-directories-first";
        ll = "eza -lbg --icons";
        la = "eza -a";
        lla = "eza -lbga --icons";
      };
    };
  };
}
