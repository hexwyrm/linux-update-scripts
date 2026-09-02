#!/bin/bash
# Unified system update script for Arch-based distros (RebornOS, Manjaro, etc.)
# Author: hexwyrm (github.com/hexwyrm)

# Update pacman packages
echo "Updating Arch-based packages (pacman)..."
sudo pacman -Syu --noconfirm

# Remove unneeded dependencies (orphans)
echo "Cleaning up unused packages..."
sudo pacman -Rns $(pacman -Qdtq) --noconfirm 2>/dev/null || echo "No orphaned packages to remove."

# Update Flatpaks
echo "Updating Flatpak packages..."
flatpak update -y

# Update Snap packages
echo "Updating Snap packages..."
sudo snap refresh

# Update system firmware
echo "Updating system firmware (fwupd)..."
sudo fwupdmgr refresh --force
sudo fwupdmgr update -y

# Check if a reboot is required
if fwupdmgr get-updates | grep -q "Reboot required"; then
    echo "⚠️ Firmware update requires a reboot. Rebooting now..."
    sudo reboot
else
    echo "✅ No reboot required. Updates complete!"
fi
