#!/bin/sh

# Battery status check
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
# Battery capacity check
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

# Show notifications
if [ "$BATTERY_STATUS" = "Discharging" ] && [ "$BATTERY_LEVEL" -le 15 ]; then
    notify-send -u critical "Battery critical!" "${BATTERY_LEVEL}%"
elif [ "$BATTERY_STATUS" = "Charging" ] && [ "$BATTERY_LEVEL" -eq 100 ]; then
    notify-send -u normal "Battery full!" "${BATTERY_LEVEL}%"
fi

