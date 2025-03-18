{ config, pkgs, ... }:
{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.packages = with pkgs; [
    gnupg
  ];

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
