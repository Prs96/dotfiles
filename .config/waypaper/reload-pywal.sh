#!/bin/bash

# Get the raw wallpaper path from config.ini
RAW_PATH=$(grep '^wallpaper =' ~/.config/waypaper/config.ini | cut -d '=' -f2- | xargs)

# Expand ~ to full home directory path
WALLPAPER="${RAW_PATH/#\~/$HOME}"

# Exit if the file doesn't exist
if [ ! -f "$WALLPAPER" ]; then
  echo "Wallpaper not found: $WALLPAPER"
  exit 1
fi

# Run pywal
wal -i "$WALLPAPER"

# Relaunch waybar
~/.config/waybar/launch.sh

# Output locations
OUT_DIR="$HOME/.config/wallpapers/cache"
OUT_TXT="$OUT_DIR/current_wallpaper"
OUT_IMG="$OUT_DIR/blurred_wallpaper.png"
OUT_COPY="$OUT_DIR/copy.png"

# Make sure output dir exists
mkdir -p "$OUT_DIR"

# Save current wallpaper path
echo "$WALLPAPER" > "$OUT_TXT"

# Generate blurred wallpaper (overwrite if exists)
convert "$WALLPAPER" -blur 0x15 "$OUT_IMG"

# Save a copy of the current wallpaper as copy.png (overwrite if exists)
convert "$WALLPAPER" "$OUT_COPY"

