function cff
    set file (find ~/.config/fish -type f | fzf)
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

function cfv
    set file (find ~/.config/nvim -type d -path ~/.config/nvim/.git -prune -o \
        ! -type d -print | fzf)
    [ -z "$file" ] || $EDITOR $file
end

function fb
    set file (find ~/.local/bin -type f | fzf)
    [ -z "$file" ] || $EDITOR $file
end

function bwin
    set winboot (efibootmgr | grep "Windows Boot Manager" |
        cut -d'*' -f1 | cut -d't' -f2)
    sudo efibootmgr --bootnext $winboot && rb
end

function frepo
    cd ~/user/works/repos
    set dir (ls $HOME/user/works/repos | fzf || echo .)
    [ "$dir" = code ] && cd code && cd (ls $HOME/user/works/repos/code |
        fzf || echo .) || cd $dir
end


function faur
    cd ~/user/works/aurs
    cd (ls $HOME/user/works/aurs | fzf || echo .)
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
