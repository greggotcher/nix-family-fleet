# hosts/gabe-m1-air.nix
# Configuration specific to Gabe's M1 MacBook Air
{ pkgs, ... }:
{
  # Import common configuration
  imports = [ ../common.nix ];

  # Set the hostname
  networking.hostName = "gabe-m1-air";
  networking.computerName = "Gabe's M1 Air";

  # ============================================================================
  # GABE-SPECIFIC NIX PACKAGES
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Add any Gabe-specific packages here
  ];

  # ============================================================================
  # GABE-SPECIFIC HOMEBREW PACKAGES
  # ============================================================================
  homebrew = {
    # Additional casks for Gabe's M1 Air
    casks = [
      "google-chrome"         # Web browser
      "libreoffice"           # Office suite
    ];
  };

  # ============================================================================
  # SYSTEM-SPECIFIC SETTINGS
  # ============================================================================
  # Dock configuration for Gabe's M1 Air
  system.defaults.dock = {
    # Use default dock settings from common.nix
    # (autohide = false, tilesize = 48)
  };

  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}