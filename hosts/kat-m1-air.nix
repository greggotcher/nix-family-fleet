# hosts/kat-m1-air.nix
# Configuration for Kat's MacBook Air
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "kat-m1-air";
  networking.computerName = "Kat's MacBook Air";

  # ============================================================================
  # NIX PACKAGES (Kat's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add Kat's specific packages here
    # Common apps (Chrome, VLC, LibreOffice) are already in common.nix
  ];

  # ============================================================================
  # HOMEBREW (Kat's M1 Air specific)
  # ============================================================================
  homebrew = {
    brews = [];
    casks = [
      # Add Kat's specific apps here
    ];
    masApps = {
      # Add Kat's App Store apps here
    };
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.kat = {
    home = "/Users/kat";
    description = "Kat";
  };
}