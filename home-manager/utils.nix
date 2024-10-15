{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bottom
    bat
    neofetch
    tmux
    lazygit

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
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.75;
      };
      colors = {
      };
    };
  };
}
