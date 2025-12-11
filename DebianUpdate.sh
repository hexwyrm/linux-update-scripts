#!/bin/bash
# Unified system update script for Debian/Ubuntu/Mint/etc
# Author: hexwyrm (github.com/hexwyrm)

# Update APT packages
echo "Updating Debian/Ubuntu packages (apt)..."
sudo apt update && sudo apt upgrade -y

# Remove unneeded dependencies
echo "Cleaning up unused packages..."
sudo apt autoremove -y

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
