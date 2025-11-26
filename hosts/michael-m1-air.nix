# hosts/michael-m1-air.nix
# Configuration for Michael's MacBook Air
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "michael-m1-air";
  networking.computerName = "Michael's MacBook Air";

  # ============================================================================
  # NIX PACKAGES (Michael's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add Michael's specific packages here
    # Common apps (Chrome, VLC, LibreOffice) are already in common.nix
  ];

  # ============================================================================
  # HOMEBREW (Michael's M1 Air specific)
  # ============================================================================
  homebrew = {
    brews = [];
    casks = [
      # Add Michael's specific apps here
    ];
    masApps = {
      # Add Michael's App Store apps here
    };
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.michael = {
    home = "/Users/michael";
    description = "Michael";
  };
}