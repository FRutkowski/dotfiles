{ pkgs, inputs, config, ... }:
let myChromium = pkgs.chromium.override { enableWideVine = true; };
in {

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/direnv
    ../../home/programs/kitty
    ../../home/programs/nvim
    ../../home/programs/qutebrowser
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/nextcloud
    ../../home/programs/yazi
    ../../home/programs/markdown
    ../../home/programs/thunar
    ../../home/programs/lazygit
    /home/filip/.config/nixos/home/programs/lf
    ../../home/programs/nh

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/gtk
    ../../home/system/wofi
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/tofi

    #./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  nixpkgs.config.chromium.enableWideVine = true;
  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # Apps
      discord-screenaudio
      bitwarden # Password manager
      vlc # Video player
      blanket # White-noise app
      tidal-hifi
      pavucontrol
      telegram-desktop
      myChromium
      brave
      libsForQt5.gwenview
      webcord
      seatd
      networkmanagerapplet
      inputs.zen-browser.packages."${system}".default

      # Dev
      go
      nodejs
      python3
      jq
      figlet
      just
      pnpm
      devenv
      typescript
      pciutils

      # Utils
      zip
      libpng
      xarchiver
      unzip
      optipng
      pfetch
      pandoc
      btop
      polychromatic
      power-profiles-daemon
      #python312Packages.openrazer

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
      glxinfo
      #cava
      # libGL
      # libGLU
      # libstdcxx5
      # libxc
      # mesa
      vscode
      jetbrains.idea-ultimate
      jetbrains.idea-community-bin
      firefox
      neovide
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.png" = { source = ./profile_picture.png; };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
