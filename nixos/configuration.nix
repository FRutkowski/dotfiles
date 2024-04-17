{ pkgs, username, hostname, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./audio.nix
    ./locale.nix
    # ./gnome.nix
    # ./hyprland.nix
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

  # virtualisation
  programs.virt-manager.enable = true;
  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  # dconf
  programs.dconf.enable = true;

  
  # neovim for root paths
  # nvim-path = "../nvim";
  # nvim-destination = "/root/.config/nvim";

  # packages
  environment.systemPackages = with pkgs; [
    home-manager
    neovim
    git
    wget
  ];

  # copying nvim
  # copyFolderToRoot = {
  #   src = nvim-path;
  #   dest = nvim-destination;
  # };

  # Kopiowanie folderu do korzenia systemu
  #environment.systemPackages = with pkgs; [
  #  (writeTextFile {
  #    name = "copy-folder-to-root";
  #    text = ''
  #      mkdir -p ${nvim-destination}
  #      cp -r ${nvim-path}/* ${nvim-destination}
  #    '';
  #  })
  #];

  # services
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    printing.enable = true;
    flatpak.enable = true;
  };

  # logind
  # services.logind.extraConfig = ''
  #   HandlePowerKey=ignore
  #   HandleLidSwitch=suspend
  #   HandleLidSwitchExternalPower=ignore
  # '';

  # kde connect
  networking.firewall = rec {
    allowedTCPPortRanges = [{ from = 1714; to = 1764; }];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

  # kde plasma
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

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

  # bootloader
  boot = {
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ntfs" ];
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = rec {
      enable = true;
      # black_hud circle_hud cross_hud square_hud
      # circuit connect cuts_alt seal_2 seal_3
      theme = "connect";
      themePackages = with pkgs; [(
        adi1090x-plymouth-themes.override {
          selected_themes = [ theme ];
        }
      )];
    };
  };

  system.stateVersion = "23.05";
}
