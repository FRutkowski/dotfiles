{ inputs, lib, ...}:
let
  nixvim = inputs.mynixvim.packages."x86_64-linux".default.extend {
    colorscheme = lib.mkForce "tokyonight";
    colorschemes = {
      tokyonight = {
        enable = true;
      };
    };
  };
in
{
  home.packages = [ nixvim ];
}
