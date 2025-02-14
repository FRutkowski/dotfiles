{ config, lib, pkgs, ... }: {
  imports = [
    ../../nixos/nvidia.nix # CHANGEME: Remove this line if you don't have an Nvidia GPU
    ../../nixos/prime.nix # CHANGEME: Remove this line if you don't have an Nvidia GPU
    ../../nixos/intel.nix

    ../../nixos/audio.nix
    ../../nixos/auto-upgrade.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/network-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/timezone.nix
    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/xdg-portal.nix
    #../../nixos/variables-config.nix
    ../../nixos/docker.nix
    ../../nixos/openrazer.nix

    #NOTE: CHANGE THEME
    /home/filip/.config/nixos/themes/stylix/nixy.nix
    # ../../themes/stylix/nixy.nix

    ./hardware-configuration.nix
    #/home/filip/.config/nixos/hosts/common/variables.nix
    ../common/variables.nix
  ];

  nixpkgs.config.chromium.enableWideVine = true;
  networking.firewall.allowedTCPPorts = [ 1883 8883 8000 ];

  nixpkgs.overlays =
    [ (final: prev: { _7zz = prev._7zz.override { useUasm = true; }; }) ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  home-manager.users."${config.var.username}" = import ../common/home.nix;
  #import /home/filip/.config/nixos/hosts/common/home.nix;
  # Don't touch this
  system.stateVersion = "24.05";
}
