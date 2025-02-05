{
  # https://github.com/anotherhadi/nixy
  description = ''
    Nixy is a NixOS configuration with home-manager, secrets and custom theming all in one place.
    It's a simple way to manage your system configuration and dotfiles.
  '';

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mynixvim = {
      url = "github:FRutkowski/test-nixvim-config";
    };
    # nvix = {url = "github:niksingh710/nvix";};
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    nixy-wallpapers = {
      url = "github:FRutkowski/wallpapers";
      flake = false;
    };
    nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    #hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    hyprpanel.url = "github:paradoxical-dev/HyprPanel/master";
    stylix.url = "github:danth/stylix";
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
    zen-browser.url = "git+https://git.sr.ht/~canasta/zen-browser-flake/"; # updated flake
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    {
      nixosConfigurations = {
        x-wing = # CHANGEME: This should match the 'hostname' in your variables.nix file
          nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              {
                nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
                _module.args = { inherit inputs; };
              }

              inputs.nixos-hardware.nixosModules.common-gpu-intel # CHANGEME: check https://github.com/NixOS/nixos-hardware
              inputs.home-manager.nixosModules.home-manager
              inputs.stylix.nixosModules.stylix
              ./hosts/laptop/configuration.nix # CHANGEME: change the path to match your host folder
            ];
          };
      };
    };
}
