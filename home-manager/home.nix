{ config, pkgs, ... }:
{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.packages = with pkgs; [
    bat
    cargo
    clippy
    fira-code
    firefox
    gcc
    gh
    gnupg
    nixfmt-rfc-style
    ranger
    rust-analyzer
    rustfmt
    tree
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
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 64;
  };

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    config = {
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";
      terminal = "kitty";
      window.border = 0;
      window.titlebar = false;
      gaps.inner = 10;
      gaps.outer = 0;
    };
    extraConfig = "
      blur enable
      blur_passes 0
      corner_radius 12
    ";
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = 0.5;
    };
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
    userName = "alanjian85";
    userEmail = "alanjian85@outlook.com";
    signing = {
      signByDefault = true;
      key = "D9C2EF4B24B630C2";
    };
    extraConfig = {
      core = {
        editor = "hx";
      };
      credential = {
        helper = "!/etc/profiles/per-user/feedc0de/bin/gh auth git-credential";
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
