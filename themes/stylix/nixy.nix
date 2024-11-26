{ pkgs, inputs, ... }: {
  stylix = {
    enable = true;

    # Edited catppuccin
    # base16Scheme = {
    #   base00 = "0b0b0b"; # Default Background
    #   base01 =
    #     "1b1b1b"; # Lighter Background (Used for status bars, line number and folding marks)
    #   base02 = "2b2b2b"; # Selection Background
    #   base03 = "45475a"; # Comments, Invisibles, Line Highlighting
    #   base04 = "585b70"; # Dark Foreground (Used for status bars)
    #   base05 = "fcfcfc"; # Default Foreground, Caret, Delimiters, Operators
    #   base06 = "f5e0dc"; # Light Foreground (Not often used)
    #   base07 = "b4befe"; # Light Background (Not often used)
    #   base08 =
    #     "f38ba8"; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
    #   base09 =
    #     "fab387"; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
    #   base0A = "f9e2af"; # Classes, Markup Bold, Search Text Background
    #   base0B = "a6e3a1"; # Strings, Inherited Class, Markup Code, Diff Inserted
    #   base0C =
    #     "94e2d5"; # Support, Regular Expressions, Escape Characters, Markup Quotes
    #   base0D =
    #     "A594FD"; # Functions, Methods, Attribute IDs, Headings, Accent color
    #   base0E =
    #     "cba6f7"; # Keywords, Storage, Selector, Markup Italic, Diff Changed
    #   base0F =
    #     "f2cdcd"; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
    # };
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
    #base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
        name = "JetBrains Mono Nerd Font";
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
    # image = "https://plus.unsplash.com/premium_photo-1674593231084-d8b27596b134?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    # nice snow image
    # image = pkgs.fetchurl {
    #   url =
    #     "https://images.unsplash.com/photo-1487782310695-ed8583618566?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    #   sha256 = "YpkS/G2hpnzuzHsmxviwGvlARbYn7fUUFJZCtpGgcek=";
    # };
    #image = /home/filip/Pictures/wallpapers/wallpapers/snow.png;
    # image = ../../wallpapers/snow.png;
    image = inputs.nixy-wallpapers + "/wallpapers/snow_purple.png";
  };

}
