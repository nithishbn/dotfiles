{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.tofi = {
    enable = true;
    settings = {
      font = "IBM Plex Serif";
      font-size = 36;

      outline-width = 0;
      border-width = 0;
      padding-left = "2%";
      padding-top = "2%";
      padding-right = 0;
      padding-bottom = 0;

      background-color = "#060606CC";
      text-color = "#f9fbff";
      selection-color = "#933";

      width = "75%";
      height = "75%";

      hide-cursor = true;
    };
  };
}
