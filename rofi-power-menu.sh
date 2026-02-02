#!/bin/bash

# Rofi Power Menu - A simple dmenu-style power management script for rofi
# Provides options for shutdown, reboot, and suspend

# Check if rofi is installed
if ! command -v rofi &> /dev/null; then
    echo "Error: rofi is not installed. Please install rofi first."
    exit 1
fi

# Check if systemctl is available (for systemd systems)
if ! command -v systemctl &> /dev/null; then
    echo "Error: systemctl is not available. This script requires systemd."
    exit 1
fi

# Options for the power menu
OPTIONS="lock\nshutdown\nreboot\nsuspend"

# Show rofi menu and get user selection
SELECTED=$(echo -e "$OPTIONS" | rofi -dmenu -p "Power Menu")

# Execute the selected action
case "$SELECTED" in
	"lock")
		slock
		;;
    "shutdown")
        echo "Shutting down..."
        systemctl poweroff
        ;;
    "reboot")
        echo "Rebooting..."
        systemctl reboot
        ;;
    "suspend")
        echo "Suspending..."
        systemctl suspend
        ;;
    *)
        echo "Invalid option selected"
        exit 1
        ;;
esac
