{ pkgs, inputs, username, ... }:
let
  homeDirectory = "/home/${username}";
in
{
  imports = [
    ./git.nix
    ./kitty.nix
    ./lf.nix
    ./neofetch.nix
    # ./neovim.nix
    ./packages.nix
    # ./sh.nix
    ./theme.nix
    ./tmux.nix
    inputs.nvchad4nix.homeManagerModule
  ];

  # news.display = "show";
  # targets.genericLinux.enable = true;

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      nixd
      (python3.withPackages(ps: with ps; [
        python-lsp-server
        flake8
      ]))
    ];
    extraConfig = pkgs.fetchFromGitHub {  # <- you can set your repo here
      owner = "NvChad";
      repo = "starter";
      rev = "41c5b467339d34460c921a1764c4da5a07cdddf7";
      sha256 = "sha256-yxZTxFnw5oV/76g+qkKs7UIwgkpD+LkN/6IJxiV9iRY=";
      name = "nvchad-2.5-starter";
    };
    hm-activation = true;
    backup = true;
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
      BAT_THEME = "base16";
      GOPATH = "${homeDirectory}/.local/share/go";
      GOMODCACHE="${homeDirectory}/.cache/go/pkg/mod";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  gtk.gtk3.bookmarks = [
    "file://${homeDirectory}/Documents"
    "file://${homeDirectory}/Music"
    "file://${homeDirectory}/Pictures"
    "file://${homeDirectory}/Videos"
    "file://${homeDirectory}/Downloads"
    "file://${homeDirectory}/Desktop"
    "file://${homeDirectory}/Projects"
    "file://${homeDirectory}/Vault"
    "file://${homeDirectory}/Vault/School"
    "file://${homeDirectory}/.config Config"
    "file://${homeDirectory}/.local/share Local"
  ];

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
