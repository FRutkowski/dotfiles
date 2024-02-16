{ pkgs, ... }: {
  home.packages = [ pkgs.kitty ];
  programs.kitty.font = "Mononoki Nerd Font Bold";
  programs.kitty.theme = "Dark pastel";
}


