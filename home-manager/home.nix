{ config, pkgs, ... }:
{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.packages = with pkgs; [
    fira-code
    firefox
    gnupg
    helix
  ];

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
      window.border = 0;
      window.titlebar = false;
      gaps.inner = 10;
      gaps.outer = 0;
      modifier = "Mod4";
      terminal = "kitty";
    };
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
