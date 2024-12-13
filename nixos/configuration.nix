{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "enigma";
  networking.wireless.enable = true;

  time.timeZone = "Asia/Taipei";

  users.users.feedc0de = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  programs.zsh.enable = true;

  services.kmscon = {
    enable = true;
    fonts = [ {
      name = "Fira Code";
      package = pkgs.fira-code;
    } ];
    extraConfig = "font-size=24";
  };

  system.stateVersion = "24.11";
}
