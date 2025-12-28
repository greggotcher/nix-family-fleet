# hosts/kat-m1-air.nix
# Configuration specific to Katarina's M1 MacBook Air
{ pkgs, ... }:
{
  # Import common configuration
  imports = [ ../common.nix ];

  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "kat-m1-air";
  networking.computerName = "Katarina's M1 Air";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  system.primaryUser = "katarina";

  # ============================================================================
  # KATARINA-SPECIFIC NIX PACKAGES
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add any Katarina-specific packages here
  ];

  # ============================================================================
  # KATARINA-SPECIFIC HOMEBREW PACKAGES
  # ============================================================================
  homebrew = {
    # Additional casks for Katarina's M1 Air
    casks = [
      # Add any Katarina-specific applications here
    ];
  };

  # ============================================================================
  # SYSTEM-SPECIFIC SETTINGS
  # ============================================================================
  # Dock configuration for Katarina's M1 Air
  system.defaults.dock = {
    # Use default dock settings from common.nix
    # (autohide = false, tilesize = 48)
    
    # Persistent apps in the Dock
    persistent-apps = [
      "/Applications/Pages.app"
      "/Applications/Keynote.app"
      "/Applications/Safari.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Reminders.app"
      "/System/Applications/Notes.app"
    ];
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.katarina = {
    home = "/Users/Katarina";
    description = "Katarina";
  };

  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}