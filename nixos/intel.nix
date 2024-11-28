{ lib, config, inputs, ... }: {
  boot.kernelParams = [ "i915.enable_guc=2" ];
  hardware.intelgpu.vaapiDriver = "intel-media-driver";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
