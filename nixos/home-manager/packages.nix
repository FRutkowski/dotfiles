{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with nodePackages_latest; [
    # gui
    (mpv.override { scripts = [mpvScripts.mpris]; })
    tidal-hifi
    telegram-desktop
    signal-desktop
    firefox
    chromium
    cinnamon.nemo
    d-spy
    easyeffects
    github-desktop
    microsoft-edge
    gimp
    discord
    bottles
    icon-library
    figma-linux
    vlc
    vscodium
    kitty
    jetbrains.idea-ultimate
    anki-bin
    wordpress
    zed-editor
    ventoy
    python3
#     # vimPlugins.nvchad-ui
#     # jetbrains.rust-rover
# 
# 
#     # tools
#     rustc
#     rustup
#     bat
#     eza
#     fd
#     ripgrep
#     fzf
#     socat
#     jq
#     acpi
#     inotify-tools
#     ffmpeg
#     libnotify
#     killall
#     zip
#     unzip
#     glib
    jdk11
    htop
    nix-ld
    emojione
    emojipick
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    libstdcxx5

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
    # cargo
    go
    pnpm
    typescript
    eslint
  ];

}
