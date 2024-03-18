{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos-pc = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.hiepnh = import ./home;
            extraSpecialArgs = { inherit inputs; };
          };
        }
      ];
    };
  };
}
