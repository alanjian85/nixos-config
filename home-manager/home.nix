{ config, pkgs, ... }:
{
  home.username = "feedc0de";
  home.homeDirectory = "/home/feedc0de";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
