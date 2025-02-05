{
  pkgs,
  inputs,
  config,
  ...
}:
let
  myChromium = pkgs.chromium.override { enableWideVine = true; };
in
{

  imports = [
    ./variables.nix

    # Programs
    ../../home/programs/direnv
    /home/filip/.config/nixos/home/programs/doomemacs
    ../../home/programs/kitty
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/nextcloud
    ../../home/programs/yazi
    ../../home/programs/markdown
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/lf
    ../../home/programs/nh

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpaper
    #NOTE: CHANGE THEME
    /home/filip/.config/nixos/home/system/hyprpanel/woodland.nix
    ../../home/system/gtk
    ../../home/system/wofi
    ../../home/system/batsignal
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/tofi
    inputs.nix-doom-emacs.hmModule

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
      inputs.mynixvim.packages.${system}.default
      telegram-desktop
      myChromium
      brave
      anydesk
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
      xarchiver
      libpng
      xarchiver
      unzip
      optipng
      pfetch
      pandoc
      btop
      rar
      polychromatic
      power-profiles-daemon
      #python312Packages.openrazer

      # Just cool
      peaclock
      cbonsai
      pipes
      cmatrix
      glxinfo
      htop
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
      tailwindcss
    ];

    sessionVariables = {
      PNPM_HOME = "$HOME/.pnpm-bin";
    };

    sessionPath = [
      "$HOME/.pnpm-bin"
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.png" = {
      source = ./profile_picture.png;
    };

    # Don't touch this
    stateVersion = "24.05";
  };

  # programs.doom-emacs = {
  #   enable = true;
  #   doomPrivateDir = ./doom.d;
  # };

  programs.home-manager.enable = true;
}
