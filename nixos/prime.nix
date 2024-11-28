{ ... }: {
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };

    #sync.enable = true;

    intelBusId =
      "PCI:0:2:0"; # Set this to the bus ID of your Intel GPU if you have one
    nvidiaBusId =
      "PCI:1:0:0"; # Set this to the bus ID of your Nvidia GPU if you have one
  };
}
