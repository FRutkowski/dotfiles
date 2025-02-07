{ inputs, lib, ...}:
let
  nixvim = inputs.mynixvim.packages."x86_64-linux".default.extend {
    colorscheme = lib.mkForce "gruvbox";
    colorschemes = {
      gruvbox = {
        enable = true;
      };
    };
  };
in
{
  home.packages = [ nixvim ];
}
