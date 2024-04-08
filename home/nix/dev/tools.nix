{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    neovide
    jetbrains-toolbox
    postman
    docker-compose
    yarn
    cargo
    nodejs_21
  ];

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
