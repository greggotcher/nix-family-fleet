# flake.nix
# This is the entry point for your Nix configuration
# It defines all your systems and their configurations
{
  description = "Family Mac systems configuration - Greg's setup";

  # Inputs are external dependencies your configuration needs
  inputs = {
    # nixpkgs is the main repository of Nix packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    # nix-darwin provides macOS-specific configuration options
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-homebrew integrates Homebrew with nix-darwin
    # This allows declarative Homebrew management
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };

    # homebrew-core and homebrew-cask are the official Homebrew taps
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  # Outputs define what this flake produces (your system configurations)
  outputs = { self, nixpkgs, nix-darwin, nix-homebrew, homebrew-core, homebrew-cask }: {
    # darwinConfigurations contains all your Mac system configurations
    darwinConfigurations = {
      
      # Greg's M1 MacBook Air
      "greg-m1-air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";  # Apple Silicon architecture
        modules = [
          ./common.nix                    # Shared config for all systems
          ./hosts/greg-m1-air.nix         # Specific config for this machine
          
          # Enable Homebrew integration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;  # Enable x86_64 emulation for Intel apps
              user = "greg";         # Your username
              
              # Use the Homebrew taps from our inputs
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              
              # Automatically migrate existing Homebrew installations
              mutableTaps = false;
            };
          }
        ];
      };

      # Greg's M4 Mac Mini Pro
      "greg-m4-mini-pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./common.nix
          ./hosts/greg-m4-mini-pro.nix
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "greg";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              mutableTaps = false;
            };
          }
        ];
      };

      # Steph's M1 MacBook Air
      "steph-m1-air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./common.nix
          ./hosts/steph-m1-air.nix
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "steph";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              mutableTaps = false;
            };
          }
        ];
      };

      # Gabe's M1 MacBook Air
      "gabe-m1-air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./common.nix
          ./hosts/gabe-m1-air.nix
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "gabe";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              mutableTaps = false;
            };
          }
        ];
      };

      # Michael's M1 MacBook Air
      "michael-m1-air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./common.nix
          ./hosts/michael-m1-air.nix
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "michael";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              mutableTaps = false;
            };
          }
        ];
      };

      # Kat's M1 MacBook Air
      "kat-m1-air" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./common.nix
          ./hosts/kat-m1-air.nix
          
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "kat";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              mutableTaps = false;
            };
          }
        ];
      };
    };
  };
}