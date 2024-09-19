{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    steam
    prismlauncher # minecraft

    moonlight-qt
  ];
}
