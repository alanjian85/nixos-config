{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics.enable = true;

  networking.hostName = "enigma";
  networking.wireless.enable = true;

  time.timeZone = "Asia/Taipei";

  users.users.feedc0de = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
    ];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  programs.zsh.enable = true;

  services.kmscon = {
    enable = true;
    fonts = [
      {
        name = "FiraCode Nerd Font Mono";
        package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      }
    ];
    extraConfig = "font-size=24";
    autologinUser = "feedc0de";
  };

  system.stateVersion = "24.11";
}
