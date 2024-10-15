{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    thunderbird
    spotify

    # messaging
    signal-desktop
    telegram-desktop
    discord

    protonvpn-gui
    protonmail-bridge-gui

    xfce.thunar # file system
    zathura # pdf viewer

    libreoffice
  ];
  programs.firefox.enable = true;
}
