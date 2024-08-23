{ nix-ld, pkgs, username, hostname, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./audio.nix
    ./locale.nix
    ./laptop.nix
  ];

  # nix
  documentation.nixos.enable = false; # .desktop
  nixpkgs.config.allowUnfree = true;
  
  # programs.java = { enable = true; package = pkgs.jdk11; };
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  # dconf
  programs.dconf.enable = true;

  # neovim for root paths
  # nvim-path = "../nvim";
  # nvim-destination = "/root/.config/nvim";

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    git
    # neovim
    wget
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";
  services.xserver.desktopManager.plasma5.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;
  

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
      plasma-browser-integration
      konsole
      oxygen
  ];
  
  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # user
  users.users.${username} = {
    isNormalUser = true;
    initialPassword = username;
    extraGroups = [
      "nixosvmtest"
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
    ];
  };


  # network
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings.General.Experimental = true; # for gnome-bluetooth percentage
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "23.05";
}
