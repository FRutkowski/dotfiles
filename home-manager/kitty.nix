{  ... }: {
  programs.kitty.enable = true;
  programs.kitty.theme = "Tokyo Night Storm";

  programs.kitty.settings = {
    font_family = "Mononoki Nerd Font Bold";
    font_size = "20.0";

    adjust_line_height = "100%";
    disable_ligatures = "cursor";

    hide_window_decorations = "titlebar-only";
    confirm_os_window_close = "100";
  };
}


