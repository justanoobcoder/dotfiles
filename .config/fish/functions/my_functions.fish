function cff
    set file (find $DOTFILES_DIR/.config/fish -type f | fzf)
    [ -z "$file" ] || $EDITOR $file
end

function cfh
    set file (find $DOTFILES_DIR/.config/hypr -type f | fzf)
    [ -z "$file" ] || $EDITOR $file
end

function ud
    if string match -rq '.*gentoo.*' (uname -r)
        sudo emerge --sync && sudo emerge -auDU @world
    else
        $AUR_HELPER -Syyu
    end
end

function mcd
    mkdir -p $argv[1] && cd $argv[1]
end

function fb
    set file (find $DOTFILES_DIR/.local/bin -type f | fzf)
    [ -z "$file" ] || $EDITOR $file
end

function bwin
    set winboot (efibootmgr | grep "Windows Boot Manager" |
        cut -d'*' -f1 | cut -d't' -f2)
    sudo efibootmgr --bootnext $winboot && rb
end

function frepo
    cd ~/user/work/repo
    cd (ls $HOME/user/work/repo | fzf || echo .)
end


function faur
    cd ~/user/work/aur
    cd (ls $HOME/user/work/aur | fzf || echo .)
end

function fparu
    if string match -rq '.*gentoo.*' (uname -r)
        echo "This function doesn't work on Gentoo"
    else
        $AUR_HELPER -Fy
        $AUR_HELPER -Slq | fzf --height=100% --multi --preview \
            '$AUR_HELPER -Si {1}' | xargs -ro $AUR_HELPER -S --needed
    end
end

function fpac
    if string match -rq '.*gentoo.*' (uname -r)
        echo "This function doesn't work on Gentoo"
    else
        sudo pacman -Fy
        pacman -Slq | fzf --height=100% --multi --preview \
            'pacman -Si {1}' | xargs -ro sudo pacman -S --needed
    end
end

function frparu
    if string match -rq '.*gentoo.*' (uname -r)
        echo "This function doesn't work on Gentoo"
    else
        $AUR_HELPER -Qqe | fzf --height=100% --multi --preview \
            '$AUR_HELPER -Si {1}' | xargs -ro $AUR_HELPER -Rns
    end
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function ts
    sesh connect \
        $(sesh list -i | \
      gum filter --limit 1 --no-sort --no-fuzzy --placeholder 'Pick a session' --prompt='⚡')
end
