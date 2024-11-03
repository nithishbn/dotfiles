{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    uv
    jetbrains.pycharm-professional
    jetbrains.rust-rover
    rustup
    gitkraken
  ];
  programs.git = {
    enable = true;
    userName = "Nithish Narasimman";
    userEmail = "gh-n@elevenbn.com";
  };
  programs.vscode = {
    enable = true;
    userSettings = {
      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "nixpkgs" = {
        "expr" = "import <nixpkgs> { }";
      };
      "formatting" = {
        "command" = ["alejandra ."];
      };
      "options" = {
        "nixos" = {
          # TODO replace hardcoded path with relative path to this nix file
          "expr" = "(builtins.getFlake \"~/dotfiles/flake.nix\").nixosConfigurations.nithish-laptop.options";
        };
        "home_manager" = {
          "expr" = "(builtins.getFlake \"~/dotfiles/flake.nix\").homeConfigurations.nithish.options";
        };
      };
    };
  };
}
