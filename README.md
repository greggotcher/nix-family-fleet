# Family Mac Systems Configuration

This repository contains the Nix configuration for managing our family's Mac systems using nix-darwin.

## Systems

- **greg-m1-air** - Greg's M1 MacBook Air
- **greg-m4-mini-pro** - Greg's M4 Mac Mini Pro
- **steph-m1-air** - Steph's M1 MacBook Air
- **gabe-m1-air** - Gabe's M1 MacBook Air
- **michael-m1-air** - Michael's M1 MacBook Air
- **kat-m1-air** - Kat's M1 MacBook Air

## Installation Priority

1. **Nix** - Preferred method for all software
2. **Homebrew/Casks** - For GUI apps not available in Nix
3. **Mac App Store** - Last resort for apps only available there

## Common Software (All Systems)

- Google Chrome (default browser)
- VLC Media Player
- LibreOffice

## Initial Setup on a New Mac

### Prerequisites

1. Install Nix (multi-user installation):
```bash
sh <(curl -L https://nixos.org/nix/install)