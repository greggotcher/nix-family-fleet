# hosts/greg-m1-air.nix
# Configuration specific to Greg's M1 MacBook Air
{ pkgs, ... }:
{
  # Import common configuration
  imports = [ ../common.nix ];

  # Set the hostname
  networking.hostName = "greg-m1-air";
  networking.computerName = "Greg's M1 Air";

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
    # Additional casks for Greg's M1 Air
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
  # Dock configuration for Greg's M1 Air
  system.defaults.dock = {
    # Use default dock settings from common.nix
    # (autohide = false, tilesize = 48)
  };

  # Enable Rosetta 2 for Intel app compatibility
  # (Already configured in flake.nix)
}