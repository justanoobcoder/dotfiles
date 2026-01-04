if command -v fastfetch >/dev/null 2>&1; then
	fastfetch
fi

autoload -U compinit; compinit

# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1a --color=always --group-directories-last $realpath'

# Automatically cd into typed directory
setopt autocd

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
ZCACHEDIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
if [ ! -d "$ZCACHEDIR" ]; then
  mkdir -p $ZCACHEDIR
fi
HISTFILE="$ZCACHEDIR/history"
HISTORY_IGNORE="(ls|pwd|cd|la|ll|lla|cl|z|g|v|clear|cd ..|cfz|cfh|fb)"
setopt inc_append_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include hidden files.

clear-keep-buffer() {
  zle clear-screen
}
zle -N clear-keep-buffer
bindkey '^Xl' clear-keep-buffer

copy-buffer() {
  printf $BUFFER | wl-copy
  zle -M "Copied to clipboard"
}
zle -N copy-buffer
bindkey '^Xc' copy-buffer

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

eval "$(zoxide init zsh)"  2>/dev/null
eval "$(starship init zsh)" 2>/dev/null

source $ZDOTDIR/zalias
source $ZDOTDIR/zfunctions
source <(fzf --zsh)
source ~/.local/share/zsh/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  2>/dev/null
