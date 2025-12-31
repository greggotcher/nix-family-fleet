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
    autohide = false;         # Don't auto-hide the dock
    tilesize = 64;            # Larger icon size for this system

    # Persistent apps in the Dock
    persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Safari.app"
      "/Applications/LibreOffice.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Notes.app"
      "/System/Applications/System Settings.app"
    ];
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