{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./waybar ./tofi];

  home.packages = with pkgs; [
    waybar
    rofi
    tofi
    dunst
    swayosd
    hyprlock
    hyprpaper
    hypridle
  ];

  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = ["--all"];
    xwayland.enable = true;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  services.dunst = {
    enable = true;
    settings = {
      global = {
        mouse_left_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };
    };
  };
  home.file.".config/hypr/" = {
    source = ./hypr;
    recursive = true;
    enable = true;
  };
}
