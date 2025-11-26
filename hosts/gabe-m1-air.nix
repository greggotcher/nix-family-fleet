# hosts/gabe-m1-air.nix
# Configuration for Gabe's MacBook Air
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "gabe-m1-air";
  networking.computerName = "Gabe's MacBook Air";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  system.primaryUser = "gabe";

  # ============================================================================
  # NIX PACKAGES (Gabe's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add Gabe's specific packages here
    # Common apps (Chrome, VLC, LibreOffice) are already in common.nix
  ];

  # ============================================================================
  # HOMEBREW (Gabe's M1 Air specific)
  # ============================================================================
  homebrew = {
    brews = [];
    casks = [
      # Add Gabe's specific apps here
    ];
    masApps = {
      # Add Gabe's App Store apps here
    };
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.gabe = {
    home = "/Users/gabe";
    description = "Gabe";
  };
}