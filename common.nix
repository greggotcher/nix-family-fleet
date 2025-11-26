# common.nix
# This file contains configuration shared across ALL your Mac systems
{ pkgs, ... }:

{
  # ============================================================================
  # NIX PACKAGES (First Priority)
  # ============================================================================
  # These are installed via Nix and are preferred whenever available
  environment.systemPackages = with pkgs; [
    # Essential command-line tools
    vim           # Text editor
    git           # Version control
    curl          # Download tool
    wget          # Another download tool
    htop          # System monitor
    tree          # Directory visualization
    jq            # JSON processor
    
    # Note: VLC and LibreOffice are not available for macOS in nixpkgs
    # They will be installed via Homebrew casks below
  ];

  # ============================================================================
  # HOMEBREW CONFIGURATION (Second Priority)
  # ============================================================================
  # Homebrew is used when packages aren't available in nixpkgs
  # or when they work better through Homebrew on macOS
  homebrew = {
    enable = true;
    
    # Update Homebrew and upgrade packages on activation
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # Clean up old versions
      cleanup = "zap";
    };

    # Global Homebrew settings
    global = {
      # Don't send analytics to Homebrew
      brewfile = true;
    };

    # -------------------------------------------------------------------------
    # HOMEBREW FORMULAE (command-line tools)
    # -------------------------------------------------------------------------
    brews = [
      "mas"  # Mac App Store CLI (useful for automation)
    ];

    # -------------------------------------------------------------------------
    # HOMEBREW CASKS (GUI applications)
    # -------------------------------------------------------------------------
    # Common GUI apps for all users
    casks = [
      "google-chrome"    # Web browser (default for all users)
      "vlc"              # Media player (not available for macOS in nixpkgs)
      "libreoffice"      # Office suite (not available for macOS in nixpkgs)
    ];

    # -------------------------------------------------------------------------
    # MAC APP STORE APPS (Third Priority)
    # -------------------------------------------------------------------------
    masApps = {
      # Add common App Store apps here if needed
    };
  };

  # ============================================================================
  # NIX CONFIGURATION
  # ============================================================================
  # Nix configuration settings
  nix.settings = {
    # Enable experimental features (needed for flakes)
    experimental-features = "nix-command flakes";
  };

  # Automatic Nix store optimization
  nix.optimise.automatic = true;

  # Allow unfree packages in nixpkgs
  nixpkgs.config.allowUnfree = true;

  # ============================================================================
  # SYSTEM SETTINGS
  # ============================================================================
  # Set your time zone
  time.timeZone = "America/Chicago";

  # macOS system defaults that apply to all machines
  system = {
    # Keyboard settings
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = false;
    };

    defaults = {
      # -----------------------------------------------------------------------
      # DOCK SETTINGS
      # -----------------------------------------------------------------------
      dock = {
        autohide = true;                      # Auto-hide the dock
        orientation = "bottom";                # Dock position
        show-recents = false;                  # Turn OFF: Show suggested and recent apps in Dock
        tilesize = 48;                         # Icon size
        minimize-to-application = true;        # Turn ON: Minimize windows into application icon
        mineffect = "scale";                   # Minimize Window Animation: Scale Effect
      };

      # -----------------------------------------------------------------------
      # FINDER SETTINGS
      # -----------------------------------------------------------------------
      finder = {
        AppleShowAllExtensions = true;         # Turn ON: Show all file extensions
        ShowPathbar = true;                    # Go → Show Path Bar
        ShowStatusBar = true;                  # View → Show Status Bar
        FXEnableExtensionChangeWarning = false; # Don't warn about extension changes
        FXPreferredViewStyle = "Nlsv";         # Set home folder to be a list view
        FXDefaultSearchScope = "SCcf";         # When performing a search: Search the current folder
        NewWindowTarget = "Home";              # New Finder windows show: Home Directory
        
        # Show on Desktop
        ShowExternalHardDrivesOnDesktop = true;  # External disks
        ShowHardDrivesOnDesktop = false;         # Internal disks (typically off)
        ShowMountedServersOnDesktop = true;      # Connected servers
        ShowRemovableMediaOnDesktop = true;      # CDs, DVDs, and iPods
        
        # Note: "Open folders in tabs" must be set manually in Finder preferences
        # as FinderSpawnTab is not available in nix-darwin
      };

      # -----------------------------------------------------------------------
      # GLOBAL macOS SETTINGS
      # -----------------------------------------------------------------------
      NSGlobalDomain = {
        # Disable automatic capitalization
        NSAutomaticCapitalizationEnabled = false;
        
        # Disable smart dashes
        NSAutomaticDashSubstitutionEnabled = false;
        
        # Disable automatic period substitution
        NSAutomaticPeriodSubstitutionEnabled = false;
        
        # Disable smart quotes
        NSAutomaticQuoteSubstitutionEnabled = false;
        
        # Enable full keyboard access for all controls
        AppleKeyboardUIMode = 3;
        
        # Set fast key repeat rate
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        
        # Show Scroll Bars: Always
        AppleShowScrollBars = "Always";
        
        # Click in the scroll bar to: Jump to the spot that's clicked
        AppleScrollerPagingBehavior = true;
        
        # Turn OFF: Natural Scrolling
        "com.apple.swipescrolldirection" = false;
      };

      # -----------------------------------------------------------------------
      # TRACKPAD SETTINGS
      # -----------------------------------------------------------------------
      trackpad = {
        Clicking = true;                       # Enable tap to click
        TrackpadRightClick = true;             # Enable two-finger right click
      };
    };

    # This should match your nix-darwin version
    stateVersion = 5;
  };
}