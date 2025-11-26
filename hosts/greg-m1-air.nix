# hosts/greg-m1-air.nix
# Configuration specific to Greg's M1 MacBook Air
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "greg-m1-air";
  networking.computerName = "Greg's M1 Air";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  # This is required for system defaults and Homebrew to work properly
  system.primaryUser = "greg";

  # ============================================================================
  # NIX PACKAGES (Greg's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode          # Visual Studio Code
    
    # Note: Handbrake is marked as broken in nixpkgs
    # It will be installed via Homebrew cask below
    # Note: MakeMKV is not available in Nix
    # It will be installed via Homebrew cask below
  ];

  # ============================================================================
  # HOMEBREW (Greg's M1 Air specific)
  # ============================================================================
  homebrew = {
    # Additional casks for this machine
    casks = [
      "handbrake"         # Video transcoder (broken in Nix, using Homebrew)
      "makemkv"           # DVD/Blu-ray ripper
    ];

    # Additional App Store apps for this machine
    masApps = {
      # Add App Store apps specific to this machine if needed
    };
  };

  # ============================================================================
  # USER CONFIGURATION
  # ============================================================================
  users.users.greg = {
    home = "/Users/greg";
    description = "Greg";
  };
}