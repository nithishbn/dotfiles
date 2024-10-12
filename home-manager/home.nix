# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  config,
  pkgs,
  lib,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./programming.nix
    ./utils.nix
    ./games.nix
    ./apps.nix
    ./hyprland
  ];

  home = {
    username = "nithish";
    homeDirectory = "/home/nithish";
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
  programs.neovim.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
