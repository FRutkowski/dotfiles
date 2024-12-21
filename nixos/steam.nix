{ config, pkgs, ... }: {
  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
  };
  environment.systemPackages = with pkgs; [ mangohud protonup ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "home/${config.var.username}/.steam/root/compatibilitytools.d";
  };
}
