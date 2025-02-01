#!/bin/bash

# Kill the current Waybar process
pkill waybar

# Wait a moment to ensure it's completely stopped
sleep 1

# Restart Waybar (adjust the command if needed based on your configuration)
waybar &
