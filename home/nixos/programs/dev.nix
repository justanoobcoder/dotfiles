{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-toolbox
    dbeaver
    postman
    docker-compose
    nodePackages.npm
    yarn
    cargo
  ];

  programs = {
    go = {
      enable = true;
      goPath = ".local/share/go";
      goBin = ".local/share/go/bin";
    };
  };

  home.file.".config/ideavim/ideavimrc".text = ''
    set clipboard+=unnamedplus
    set clipboard+=ideaput
    set number
    set relativenumber

    let mapleader=" "

    " Replace all
    nnoremap <leader>s :%s//g<Left><Left>
  '';
}

