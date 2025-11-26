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
  # NIX PACKAGES (Greg's M4 Mini Pro specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode          # Visual Studio Code (available in Nix)
    
    # Video tools
    handbrake       # Video transcoder (available in Nix)
    
    # Note: DaVinci Resolve and MakeMKV are not available in Nix
    # They will be installed via Homebrew casks below
  ];

  # ============================================================================
  # HOMEBREW (Greg's M4 Mini Pro specific)
  # ============================================================================
  homebrew = {
    # Additional casks for this machine
    casks = [
      "davinci-resolve"   # Professional video editing software
      "makemkv"           # DVD/Blu-ray ripper
      
      # Note: Handbrake and VS Code are installed via Nix above for better integration
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