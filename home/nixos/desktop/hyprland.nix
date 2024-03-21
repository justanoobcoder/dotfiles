{ pkgs, config, ... }:

let inherit (import ../../../options.nix) flakeDir;
in {
  home.packages = with pkgs; [ hyprlock hypridle hyprcursor ];

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink "${flakeDir}/home/config/hypr";
    recursive = true;
  };
}
