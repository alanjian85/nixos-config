{ config, pkgs, ... }:

{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.packages = with pkgs; [
    bat
    ranger

    gh
    gnupg
  ];

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [ onedark-theme ];
    extraConfig = ''
    set -g window-style 'fg=color250,bg=colour234'
    set -g window-active-style 'fg=color255,bg=colour234'

    set -g pane-border-style 'fg=colour250,bg=colour234'
    set -g pane-active-border-style 'fg=colour255,bg=colour234'
    '';
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "afowler";
    };
    initExtra = ''
    if [ "$TMUX" = "" ]; then
      tmux
    else
      export TERM=xterm-256color
    fi
    '';
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
