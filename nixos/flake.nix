{
  description = "Home Manager and NixOS configuration of Filip";

  outputs = { nix-ld, home-manager, nixpkgs, ... }@inputs: let
    username = "filip";
    hostname = "x-wing123";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    # asztal = pkgs.callPackage ./ags { inherit inputs; };
  in {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs username hostname; };
      modules = [ 
         ./nixos/configuration.nix 
         nix-ld.nixosModules.nix-ld
          {
            nixpkgs = {
              overlays = [
                inputs.nvchad4nix.overlays.default
              ];
            };
          }
         { programs.nix-ld.dev.enable = true; }
      ];
    };

    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs username; };
      modules = [ ./home-manager/home.nix ];
    };

    # packages.${system}.default = asztal;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad4nix = {
    url = "github:NvChad/nix";
    inputs.nixpkgs.follows = "nixpkgs";
    };

    matugen.url = "github:InioX/matugen";

    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
  };
}
