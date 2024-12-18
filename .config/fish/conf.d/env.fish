# You can change this to your own dotfiles directory.
set -gx DOTFILES_DIR $HOME/user/dotfiles

# Default program.
set -gx EDITOR nvim
set -gx TERMINAL foot
set -gx BROWSER zen-browser
set -gx AUR_HELPER paru

# Some default config directories
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# X11
set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx XSERVERRC $XDG_CONFIG_HOME/X11/xserverrc

# Ibus
#set -gx GTK_IM_MODULE fcitx
set -gx XMODIFIERS @im=fcitx
set -gx QT_IM_MODULE fcitx
set -gx QT4_IM_MODULE fcitx
set -gx CLUTTER_IM_MODULE fcitx
set -gx GLFW_IM_MODULE fcitx

# Fzf
set -gx FZF_DEFAULT_OPTS "--layout=reverse --height 40% --color=16 --border"

# Java
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk

# Others
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx MACHINE_STORAGE_PATH $XDG_DATA_HOME/docker-machine
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
set -gx GRADLE_USER_HOME $XDG_DATA_HOME/gradle
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc
set -gx TERMINFO $XDG_DATA_HOME/terminfo
set -gx TERMINFO_DIRS $XDG_DATA_HOME/terminfo:/usr/share/terminfo
# Warning: This following line will break some DMs. Remove this line if you're using DMs like lightdm, gdm, sddm,...
set -gx XAUTHORITY $XDG_RUNTIME_DIR/Xauthority
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -gx LESSHISTFILE -
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx _JAVA_AWT_WM_NONREPARENTING 1
