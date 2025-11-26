# hosts/steph-m1-air.nix
# Configuration for Steph's MacBook Air
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "steph-m1-air";
  networking.computerName = "Steph's MacBook Air";

  # ============================================================================
  # NIX PACKAGES (Steph's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add Steph's specific packages here
    # Common apps (Chrome, VLC, LibreOffice) are already in common.nix
  ];

  # ============================================================================
  # HOMEBREW (Steph's M1 Air specific)
  # ============================================================================
  homebrew = {
    brews = [];
    casks = [
      # Add Steph's specific apps here
    ];
    masApps = {
      # Add Steph's App Store apps here
    };
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.steph = {
    home = "/Users/steph";
    description = "Steph";
  };
}