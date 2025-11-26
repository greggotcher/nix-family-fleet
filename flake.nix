{
  description = "Nix-darwin configuration for the Gotcher family Mac fleet";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core, homebrew-cask }:
  let
    configuration = { pkgs, config, ... }: {
      # Set the system architecture for Apple Silicon
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Import the common configuration
      imports = [ ./common.nix ];

      # Nix-homebrew configuration
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = config.system.primaryUser;
        autoMigrate = true;  # Enable auto-migration of existing Homebrew
        taps = {
          "homebrew/homebrew-core" = homebrew-core;
          "homebrew/homebrew-cask" = homebrew-cask;
        };
      };
    };
  in
  {
    darwinConfigurations = {
      # Greg's M4 Mac Mini Pro
      "greg-m4-mini-pro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/greg-m4-mini-pro.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };

      # Greg's M1 MacBook Air
      "greg-m1-air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/greg-m1-air.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };

      # Steph's M1 MacBook Air
      "steph-m1-air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/steph-m1-air.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };

      # Gabe's M1 MacBook Air
      "gabe-m1-air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/gabe-m1-air.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };

      # Michael's M1 MacBook Air
      "michael-m1-air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/michael-m1-air.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };

      # Kat's M1 MacBook Air
      "kat-m1-air" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./hosts/kat-m1-air.nix
          nix-homebrew.darwinModules.nix-homebrew
        ];
      };
    };
  };
}