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
  ];
  programs.firefox.enable = true;
}
