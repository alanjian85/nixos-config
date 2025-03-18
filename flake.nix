{
  description = "NixOS configuration of Enigma";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    {
      nixosConfigurations.enigma = nixpkgs.lib.nixosSystem {
        modules = [ ./nixos/configuration.nix ];
      };
    };
}
