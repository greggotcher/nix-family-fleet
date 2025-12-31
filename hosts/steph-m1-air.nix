# hosts/steph-m1-air.nix
# Configuration specific to Stephanie's M1 MacBook Air
{ pkgs, ... }:
{
  # Import common configuration
  imports = [ ../common.nix ];

  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "steph-m1-air";
  networking.computerName = "Stephanie's M1 Air";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  system.primaryUser = "stephanie";
  # Set the hostname


  # ============================================================================
  # STEPHANIE-SPECIFIC NIX PACKAGES
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add any Stephanie-specific packages here
  ];

  # ============================================================================
  # STEPHANIE-SPECIFIC HOMEBREW PACKAGES
  # ============================================================================
  homebrew = {
    # Additional casks for Stephanie's M1 Air
    casks = [
      "google-chrome"         # Web browser
      "libreoffice"           # Office suite
    ];
  };

  # ============================================================================
  # SYSTEM-SPECIFIC SETTINGS
  # ============================================================================
  # Dock configuration for Stephanie's M1 Air
  system.defaults.dock = {
    # Use default dock settings from common.nix
    # (autohide = false, tilesize = 48)
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.stephanie = {
    home = "/Users/stephanie";
    description = "Stephanie";
  };

  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}