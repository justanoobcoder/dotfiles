source ~/.config/fish/functions/my_functions.fish

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx $XINITRC
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

fastfetch
starship init fish | source
