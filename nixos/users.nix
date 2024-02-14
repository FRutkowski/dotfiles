{ config, lib, pkgs, ... }: {

   users.users.filip = {
     isNormalUser = true;
     home = "/home/filip";
     description = "Filip Rutkowski";
     extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"

     ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
        firefox
	chromium
        tree
        neofetch
	telegram-desktop
	signal-desktop
 	vscode
 	nodePackages.pnpm
 	nodePackages.npm
	flatpak
    	jetbrains.idea-ultimate
    	docker
	nodejs
	neovide
        cinnamon.nemo
        kitty
     ];

   };

   programs.kitty.font.name = "CommicShannsMono Nerd Font";
   programs.kitty.font.size = "12";
   programs.kitty.theme = "Apprentice";
}

