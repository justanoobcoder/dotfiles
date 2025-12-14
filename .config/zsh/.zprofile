if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    start-hyprland
fi
