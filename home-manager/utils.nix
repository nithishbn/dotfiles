{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bottom
    neofetch
    
    bitwarden-desktop
    bitwarden-cli

    pavucontrol  
    easyeffects  

    starship
    kitty
  ];
}
