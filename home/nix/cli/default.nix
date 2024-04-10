{
  imports = [
    ./terminals.nix
    ./fish.nix
    ./fastfetch.nix
    ./startship.nix
  ];

  programs = {
    eza = {
      enable = true;
      extraOptions = [ "--group-directories-first" ];
    };
    zoxide = {
      enable = true;
    };
    fzf = {
      enable = true;
    };
    btop.enable = true;
    jq.enable = true;
    ssh.enable = true;
  };
}
