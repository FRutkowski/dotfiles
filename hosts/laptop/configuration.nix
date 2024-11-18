{ config, lib, pkgs, ... }: {
  imports = [
    ../../nixos/nvidia.nix # CHANGEME: Remove this line if you don't have an Nvidia GPU
    #../../nixos/prime.nix # CHANGEME: Remove this line if you don't have an Nvidia GPU

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
    ../../nixos/variables-config.nix
    ../../nixos/docker.nix
    #../../nixos/openrazer.nix
    #(import ../../nixos/openrazer.nix { inherit pkgs; })

    ../../themes/stylix/nixy.nix

    ./hardware-configuration.nix
    ./variables.nix
  ];

  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [ openrazer-daemon ];

  nixpkgs.config.chromium.enableWideVine = true;
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

  # system.activationScripts.cleanHyprlandConfig = lib.mkAfter ''
  #   if [ -f /home/${config.var.username}/.config/hyprland.conf ]; then
  #     sed -i '/^col\.shadow/d' /home/${config.var.username}/.config/hyprland.conf
  #   fi
  # '';

  home-manager.users."${config.var.username}" = import ./home.nix;
  # Don't touch this
  system.stateVersion = "24.05";
}
