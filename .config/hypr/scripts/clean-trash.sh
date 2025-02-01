#!/bin/bash

# File to track boot count
BOOT_COUNT_FILE="$HOME/.cache/boot_count"

# Initialize boot count if the file doesn't exist
if [ ! -f "$BOOT_COUNT_FILE" ]; then
  echo 0 >"$BOOT_COUNT_FILE"
fi

# Read the current boot count
BOOT_COUNT=$(cat "$BOOT_COUNT_FILE")

# Increment the boot count
BOOT_COUNT=$((BOOT_COUNT + 1))
echo "$BOOT_COUNT" >"$BOOT_COUNT_FILE"

# Check if it's the 5th boot
if [ "$BOOT_COUNT" -ge 5 ]; then
  notify-send "Reminder" "Time to clean your trash!"
  # Reset the boot count
  echo 0 >"$BOOT_COUNT_FILE"
fi
