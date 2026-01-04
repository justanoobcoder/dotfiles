export GOPATH=$XDG_DATA_HOME/go
export GOMODCACHE=$XDG_CACHE_HOME/go/mod
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export MACHINE_STORAGE_PATH=$XDG_DATA_HOME/docker-machine
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

export PATH="$PATH:$GOPATH/bin:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR=nvim
export BROWSER=zen-browser
export TERMINAL=kitty

export FZF_DEFAULT_OPTS="--layout=reverse --height 40% --color=16 --border --tmux=center"

export DOTFILES_DIR=$HOME/.dotfiles
