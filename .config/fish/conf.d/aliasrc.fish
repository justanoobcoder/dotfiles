if type -q exa
    alias ls "exa --group-directories-first"
    alias ll "ls -lbg --icons"
    alias lla "ll -a"
    alias la "ls -a"
end

if type -q nvim
    alias v nvim
else if type -q vim
    alias v vim
else if type -q vi
    alias v vi
end

if type -q edit
    alias sv "sudo edit"
else if type -q sudoedit
    alias sv sudoedit
end

alias grep "grep --color=auto"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
alias cl clear
alias sd "sudo shutdown -h now"
alias rb "sudo shutdown -r now"
alias cfx "$EDITOR ~/.config/X11/xinitrc"
alias cfxp "$EDITOR ~/.config/X11/xprofile"
alias cfz "$EDITOR ~/.config/zsh/.zshrc"
alias cfzp "$EDITOR ~/.config/zsh/.zprofile"
alias cfze "$EDITOR ~/.config/zsh/.zshenv"
alias cfa "$EDITOR ~/.config/aliasrc"
alias cfp "$EDITOR ~/.config/polybar/config"
alias cdu "cd /run/media/$USER"
alias wget 'wget --hsts-file "$XDG_CACHE_HOME/wget-hsts"'
alias yarn 'yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias config 'git --git-dir=$HOME/user/works/repos/dotfiles/ --work-tree=$HOME'
alias g lazygit
alias gh "lazygit -w $HOME -g $HOME/user/works/repos/dotfiles/"
