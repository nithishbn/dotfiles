{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    warp-terminal
    vscode
    uv
    jetbrains.pycharm-professional
    jetbrains.rust-rover
    rustup
    gitkraken
  ];

  programs.git = {
    enable = true;
    userName = "Nithish";
    userEmail = "gh-n@elevenbn.com";
  };
}
