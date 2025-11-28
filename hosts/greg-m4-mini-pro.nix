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
    autohide = false;      # Don't auto-hide the dock
    tilesize = 80;         # Larger icon size (80px)
    
    # Dock applications (in order)
    # Note: Finder is always present and should not be added here
    persistent-apps = [
      "/Applications/DaVinci Resolve/DaVinci Resolve.app"
      "/Applications/Google Chrome.app"
      "/Applications/Nix Apps/Visual Studio Code.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Reminders.app"
      "/System/Applications/Notes.app"
      "/System/Applications/iPhone Mirroring.app"
      "/System/Applications/System Settings.app"
      "/System/Applications/Utilities/Terminal.app"
    ];
  };

  # ============================================================================
  # POWER MANAGEMENT
  # ============================================================================
  # Sleep settings (in minutes, 0 = never)
  system.activationScripts.postActivation.text = ''
    # Restart automatically after power failure
    /usr/bin/pmset -a autorestart 1
    
    # Display sleep after 30 minutes
    /usr/bin/pmset -a displaysleep 30
    
    # Computer sleep after 60 minutes (0 = never)
    /usr/bin/pmset -a sleep 60
    
    # Disk sleep after 30 minutes (0 = never)
    /usr/bin/pmset -a disksleep 30
    
    # Wake for network access (useful for remote access)
    /usr/bin/pmset -a womp 1
    
    # Wake when iPhone/Apple Watch is nearby
    /usr/bin/pmset -a proximitywake 1
  '';

  # ============================================================================
  # NETWORK MOUNTS
  # ============================================================================
  # Automatically mount network drives at login
  launchd.user.agents.mountMoviesShare = {
    serviceConfig = {
      ProgramArguments = [
        "/usr/bin/osascript"
        "-e"
        "mount volume \"smb://10.250.1.1/movies\""
      ];
      RunAtLoad = true;
      StandardErrorPath = "/tmp/mount-movies-share.err";
      StandardOutPath = "/tmp/mount-movies-share.out";
    };
  };

  # ============================================================================
  # NIX PACKAGES (Greg's M4 Mini Pro specific)
  # ============================================================================
  environment.systemPackages = with pkgs; [
    # Development tools
    vscode          # Visual Studio Code (available in Nix)
    jre             # Java Runtime Environment (latest version, runtime only)
    
    # Note: Handbrake and MakeMKV are not available in Nix
    # They will be installed via Homebrew casks below
    # Note: DaVinci Resolve Studio must be downloaded manually from:
    # https://www.blackmagicdesign.com/products/davinciresolve
  ];

  # ============================================================================
  # HOMEBREW (Greg's M4 Mini Pro specific)
  # ============================================================================
  homebrew = {
    # Additional casks for this machine
    casks = [
      "handbrake-app"            # Video transcoder
      "makemkv"                  # DVD/Blu-ray ripper
      
      # Note: DaVinci Resolve Studio is not available via Homebrew
      # Download manually from Blackmagic Design website
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