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

    # Java Development Kit (includes JRE)
    jdk                       # Latest Java JDK
  ];

  # ============================================================================
  # GREG-SPECIFIC HOMEBREW PACKAGES
  # ============================================================================
  homebrew = {
    # Additional casks for Greg's M1 Air
    casks = [
      "handbrake-app"         # Video transcoder
      "affinity"              # Affinity V3 (unified Designer, Photo, Publisher)
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