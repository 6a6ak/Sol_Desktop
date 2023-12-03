#!/bin/bash

echo "GNOME Desktop Environment Installation for Solaris"

# Function to prompt for a yes/no response
ask_to_proceed() {
    while true; do
        read -p "$1 (yes/no): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Update package repository
if ask_to_proceed "Do you want to update the package repository?"; then
    echo "Updating package repository..."
    sudo pkg update
else
    echo "Skipping package repository update."
fi

# Install GNOME desktop
if ask_to_proceed "Do you want to install the GNOME desktop environment?"; then
    echo "Installing the GNOME desktop environment..."
    sudo pkg install solaris-desktop
else
    echo "Skipping GNOME desktop installation."
fi

# Enable LightDM display manager
if ask_to_proceed "Do you want to enable the LightDM display manager?"; then
    echo "Enabling the LightDM display manager..."
    sudo svcadm enable lightdm
else
    echo "Skipping enabling LightDM."
fi

# Reboot system
if ask_to_proceed "Installation complete. Do you want to reboot now?"; then
    echo "Rebooting the system..."
    sudo reboot
else
    echo "System reboot skipped. Reboot manually to apply changes."
fi
