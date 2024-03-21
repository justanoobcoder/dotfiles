{ pkgs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  home.file.".config/fastfetch/config.jsonc".text = ''
    {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "modules": [
            "title",
            "separator",
            "os",
            "host",
            "kernel",
            "shell",
            "display",
            "de",
            "wm",
            "wmtheme",
            "theme",
            "icons",
            "font",
            "cursor",
            "terminal",
            "terminalfont",
            "cpu",
            "gpu",
            "memory",
            {
                "type": "disk",
                "folders": "/"
            },
            "battery",
            "poweradapter",
            "break",
            "colors"
        ]
    }'';
}
