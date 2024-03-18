{ pkgs, config, ... }: 

{
  home.packages = with pkgs; [
    jetbrains.idea-ultimate
    dbeaver
    postman
    docker-compose
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
  ];

  home.file.".config/ideavim/ideavimrc".text = ''
set clipboard+=unnamedplus
set clipboard+=ideaput
set number
set relativenumber

let mapleader=" "

" Replace all
nnoremap <leader>s :%s//g<Left><Left>'';
}

