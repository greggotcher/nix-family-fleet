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
  # PRIMARY USER
  # ============================================================================
  system.primaryUser = "michael";

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

# Mac App Store apps for Michael
    masApps = {
      "GarageBand" = 682658836;    # Music creation software
    };
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
  users.users.michael = {
    home = "/Users/michael";
    description = "Michael";
  };


  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}