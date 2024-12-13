{ config, pkgs, ... }:

{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.packages = with pkgs; [
    bat
    ranger
    tmux

    gh
    gnupg
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "afowler";
    };
    initExtra = ''if [ "$TMUX" = "" ]; then tmux; fi'';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
