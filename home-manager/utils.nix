{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bottom
    bat
    neofetch

    bitwarden-desktop
    bitwarden-cli

    pavucontrol
    easyeffects

    starship
    kitty

    cups
    playerctl
    brightnessctl

    grimblast # screenshot
  ];
}
