{ pkgs, ... }:
let
  theme = {
    name = "adw-gtk3-dark";
    package = pkgs.adw-gtk3;
  };
  font = {
    name = "Ubuntu Nerd Font";
    package = pkgs.nerdfonts;
  };
  cursorTheme = {
    name = "Qogir";
    size = 24;
    package = pkgs.qogir-icon-theme;
  };
in
{
  home = {
    packages = with pkgs; [
      cantarell-fonts
      font-awesome
      theme.package
      font.package
      cursorTheme.package
      gnome.adwaita-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursorTheme.name;
      XCURSOR_SIZE = "${toString cursorTheme.size}";
    };
    pointerCursor = cursorTheme // {
      gtk.enable = true;
    };
    file = {
      ".local/share/themes/${theme.name}" = {
        source = "${theme.package}/share/themes/${theme.name}";
      };
      ".config/gtk-4.0/gtk.css".text = ''
        window.messagedialog .response-area > button,
        window.dialog.message .dialog-action-area > button,
        .background.csd{
          border-radius: 0;
        }
      '';
    };
  };

  fonts.fontconfig.enable = true;

  qt = {
    enable = true;
    platformTheme = "kde";
  };
}
