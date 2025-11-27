# Family Mac Systems Configuration

This repository contains the Nix configuration for managing our family's Mac systems using nix-darwin.

## Managed Systems

- **greg-m1-air** - Greg's M1 MacBook Air
- **greg-m4-mini-pro** - Greg's M4 Mac Mini Pro
- **steph-m1-air** - Stephanies's M1 MacBook Air
- **gabe-m1-air** - Gabe's M1 MacBook Air
- **michael-m1-air** - Michael's M1 MacBook Air
- **kat-m1-air** - Katarina's M1 MacBook Air

## Installation Priority

1. **Nix** - Preferred method for all software
2. **Homebrew/Casks** - For GUI apps not available in Nix
3. **Mac App Store** - Last resort for apps only available there

## Common Software (All Systems)

- Google Chrome (default browser)
- VLC Media Player
- LibreOffice

## Installation on a New Mac

Follow these steps to set up nix-darwin on each Mac:

### 1. Install Nix (Determinate Systems Installer)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

### 2. Clone This Repository

```bash
git clone https://github.com/greggotcher/nix-family-fleet.git ~/Documents/GitHub/nix-config
cd ~/Documents/GitHub/nix-config

### 3. Run the Configuration

```bash
# Run the appropriate configuration for your machine
sudo nix run nix-darwin -- switch --flake .#<hostname>

# Examples:
# sudo nix run nix-darwin -- switch --flake .#greg-m4-mini-pro
# sudo nix run nix-darwin -- switch --flake .#greg-m1-air
# sudo nix run nix-darwin -- switch --flake .#steph-m1-air
# sudo nix run nix-darwin -- switch --flake .#gabe-m1-air
# sudo nix run nix-darwin -- switch --flake .#michael-m1-air
# sudo nix run nix-darwin -- switch --flake .#kat-m1-air

### 4. Restart Your Terminal
After the initial installation, close and reopen your terminal to load the new environment.