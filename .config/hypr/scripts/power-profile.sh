#!/bin/bash
CHARGING=$(cat /sys/class/power_supply/AC*/online)

if [ "$CHARGING" -eq 1 ]; then
    # Set performance profile when charging
    powerprofilesctl set performance
else
    # Set balanced profile when on battery
    powerprofilesctl set balanced
fi

