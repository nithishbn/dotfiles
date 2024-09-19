{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./waybar];

  home.packages = with pkgs; [
    waybar
    tofi
    dunst
    swayosd
    hyprlock
    hyprpaper
  ];

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  home.file.".config/hypr/" = {
    source = ./hypr;
    recursive = true;
    enable = true;
  };
}
