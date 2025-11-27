# hosts/greg-m4-mini-pro.nix
# Configuration specific to Greg's M4 Mac Mini Pro
{ pkgs, ... }:

{
  # ============================================================================
  # SYSTEM IDENTIFICATION
  # ============================================================================
  networking.hostName = "greg-m4-mini-pro";
  networking.computerName = "Greg's M4 Mini Pro";

  # ============================================================================
  # PRIMARY USER
  # ============================================================================
  # This is required for system defaults and Homebrew to work properly
  system.primaryUser = "greg";

  # ============================================================================
  # SYSTEM DEFAULTS (Greg's M4 Mini Pro specific overrides)
  # ============================================================================
  system.defaults.dock = {
    tilesize = 64;         # Larger icon size (override common.nix default of 48)
  };

  # ============================================================================
  # NIX PACKAGES (Greg's M4 Mini Pro specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode          # Visual Studio Code (available in Nix)
    
    # Note: Handbrake, DaVinci Resolve and MakeMKV are not available in Nix
    # They will be installed via Homebrew casks below
  ];

  # ============================================================================
  # HOMEBREW (Greg's M4 Mini Pro specific)
  # ============================================================================
  homebrew = {
    # Additional casks for this machine
    casks = [
      "davinci-resolve-studio"   # Professional video editing software (use studio version)
      "handbrake-app"            # Video transcoder (renamed from handbrake)
      "makemkv"                  # DVD/Blu-ray ripper
      
      # Note: VS Code is installed via Nix above for better integration
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