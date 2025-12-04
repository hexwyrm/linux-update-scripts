#!/bin/bash
# Unified system update script for Fedora

# Update DNF packages
echo "Updating Fedora packages (dnf)..."
sudo dnf upgrade --refresh -y

# Remove unneeded dependencies
echo "Cleaning up unused packages..."
sudo dnf autoremove -y

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
