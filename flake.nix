{
  description = "A Determinate-Nix-on-Lima configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-lima = {
      url = "github:nixos-lima/nixos-lima/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, determinate, nixos-lima, home-manager, ... }@inputs:
    {
        nixosConfigurations.determinate-aarch64 = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          modules = [
            determinate.nixosModules.default
            nixos-lima.nixosModules.lima
            ./determinate-nixos-config.nix
          ];
        };
        nixosConfigurations.determinate-x86_64 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            determinate.nixosModules.default
            nixos-lima.nixosModules.lima
            ./determinate-nixos-config.nix
          ];
        };
    };
}
