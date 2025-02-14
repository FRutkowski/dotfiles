{ pkgs, inputs, ... }: {
  # imports = [
  #   /home/filip/.config/nixos/home/system/hyprpanel/woodland.nix
  # ];

  stylix = {
    enable = true;

    # Edited catppuccin
    base16Scheme = {
        base00 = "231e18";
        base01 = "302b25";
        base02 = "48413a";
        base03 = "9d8b70";
        base04 = "b4a490";
        base05 = "cabcb1";
        base06 = "d7c8bc";
        base07 = "e4d4c8";
        base08 = "d35c5c";
        base09 = "ca7f32";
        base0A = "e0ac16";
        base0B = "b7ba53";
        base0C = "6eb958";
        base0D = "6eb958";
        base0E = "bb90e2";
        base0F = "b49368";
    };
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/woodland.yaml";

    cursor = {
      package = pkgs.vimix-cursors;
      name = "Vimix-cursors";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;        name = "JetBrains Mono Nerd Font";
      };
      sansSerif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      serif = {
        package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd;
        name = "SFProDisplay Nerd Font";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 13;
        terminal = 13;
      };
    };

    polarity = "dark";
    image = pkgs.fetchurl {
      url =
        "https://github.com/FRutkowski/wallpapers/blob/main/wallpapers/jg.png?raw=true";
      sha256 = "sTWdddCTPhvYizaNKQQ15q9K9Ms3ZM9xzH26J+ozDv0=";

    };
  };

}
