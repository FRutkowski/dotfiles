{ config, pkgs, ... }: {
  programs = {
    steam.enable = false;
    steam.gamescopeSession.enable = false;
    gamemode.enable = false;
  };
  environment.systemPackages = with pkgs; [ mangohud protonup ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH =
      "home/${config.var.username}/.steam/root/compatibilitytools.d";
  };
}
