# hosts/greg-m4-mini-pro.nix
# Configuration specific to Greg's M4 Mac Mini Pro
{ pkgs, ... }:
{
  # Import common configuration
  imports = [ ../common.nix ];

  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "greg-m4-mini-pro";
  networking.computerName = "Greg's M4 Mini Pro";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  system.primaryUser = "greg";

  # ============================================================================
  # GREG-SPECIFIC NIX PACKAGES
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode                    # Visual Studio Code

    # Java Runtime Environment
    jre                       # Java Runtime Environment (latest version, runtime only)
  ];

  # ============================================================================
  # GREG-SPECIFIC HOMEBREW PACKAGES
  # ============================================================================
  homebrew = {
    # Additional casks for Greg's M4 Mini Pro
    casks = [
      "google-chrome"         # Web browser
      "libreoffice"           # Office suite
      "handbrake-app"         # Video transcoder
      "affinity"              # Affinity V3 (unified Designer, Photo, Publisher)
      "microsoft-remote-desktop" # RDP client for Windows machines
    ];
  };

  # ============================================================================
  # SYSTEM-SPECIFIC SETTINGS
  # ============================================================================
  # Dock configuration for Greg's M4 Mini Pro
  system.defaults.dock = {
    autohide = false;         # Don't auto-hide the dock
    tilesize = 80;            # Larger icon size for this system

    # Persistent apps in the Dock
    persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Nix Apps/Visual Studio Code.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Messages.app"
      "/Applications/DaVinci Resolve/DaVinci Resolve.app"
      "/System/Applications/System Settings.app"
    ];
  };

  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}