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
  # NIX PACKAGES (Greg's M1 Air specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode          # Visual Studio Code
    
    # Video tools
    handbrake       # Video transcoder
    
    # Note: MakeMKV is not available in Nix
    # It will be installed via Homebrew cask below
  ];

  # ============================================================================
  # HOMEBREW (Greg's M1 Air specific)
  # ============================================================================
  homebrew = {
    # Additional casks for this machine
    casks = [
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