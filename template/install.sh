#!/bin/sh

set -e

SCRIPT_DIR=$(dirname "$0")
TEMPLATE_DIR="$SCRIPT_DIR/profiles"
TARGET_DIR="/etc/svcctl/profiles"

if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root"
    exit 1
fi

if [ ! -d "$TEMPLATE_DIR" ]; then
    echo "Error: Template directory not found: $TEMPLATE_DIR"
    exit 1
fi

echo "Installing profiles from $TEMPLATE_DIR to $TARGET_DIR..."

mkdir -p "$TARGET_DIR"

for profile_dir in "$TEMPLATE_DIR"/*; do
    [ -d "$profile_dir" ] || continue
    profile_name=$(basename "$profile_dir")
    
    echo "Installing profile: $profile_name"
    cp -r "$profile_dir" "$TARGET_DIR/"
done

echo "Profiles installed successfully!"
echo ""
echo "Available profiles:"
ls -1 "$TARGET_DIR"
echo ""
echo "You can now use: svcctl profile list"
echo "                 svcctl profile show <profile>"
echo "                 svcctl profile apply <profile>"

