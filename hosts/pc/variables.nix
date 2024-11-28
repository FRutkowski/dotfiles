{ config, ... }: {
  imports = [ ../../nixos/variables-config.nix ];

  config.var = {
    hostname = "x-wing";
    username = "filip";
    configDirectory = "/home/" + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "pl";

    location = "Warsaw";
    timeZone = "Europe/Warsaw";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "pl_PL.UTF-8";

    git = {
      username = "Frutkowski";
      email = "frutkowski80@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;

    theme = import ../../themes/var/nixy.nix;
  };
}
