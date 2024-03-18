{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with nodePackages_latest; with gnome; [
    sway
    # colorscript
    (import ./colorscript.nix { inherit pkgs; })

    # gui
    (mpv.override { scripts = [mpvScripts.mpris]; })
    tidal-hifi
    telegram-desktop
    signal-desktop
    d-spy
    easyeffects
    github-desktop
    gimp
    discord
    bottles
    icon-library
    dconf-editor
    figma-linux
    vscode
    weka
    kitty
    jetbrains.idea-ultimate

    # tools
    bat
    eza
    fd
    ripgrep
    fzf
    socat
    jq
    acpi
    inotify-tools
    ffmpeg
    libnotify
    killall
    zip
    unzip
    glib
    jdk11
    htop
    nix-ld

    # hyprland
    wl-gammactl
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    slurp
    imagemagick
    pavucontrol
    brightnessctl
    swww


    # fun
    glow
    slides
    skate
    yabridge
    yabridgectl
    wine-staging
    distrobox

    # langs
    nodejs
    gjs
    bun
    cargo
    go
    pnpm
    typescript
    eslint
  ];

}
