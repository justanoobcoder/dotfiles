source ~/.config/fish/functions/my_functions.fish

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        set -gx PATH "$PATH:$HOME/.local/share/npm/bin:$HOME/.local/share/go/bin:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"
        #exec startx $XINITRC
        exec Hyprland
    end
end

fish_vi_key_bindings
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

# ctrl+h for history search, ctrl+p for process search
fzf_configure_bindings --history=\cu --processes=\cp

if type -q fastfetch
    if test -z "$TMUX"
        fastfetch
    end
else
    echo "fastfetch not found, please install it"
end

if type -q starship
    starship init fish | source
else
    echo "starship not found, please install it"
end

if type -q zoxide
    zoxide init fish | source
else
    echo "zoxide not found, please install it"
end
