#!/bin/bash
# ~/.config/waybar/scripts/terminal.sh

# Launch kitty with immediate floating
hyprctl dispatch exec "[float] kitty --class dotfiles-floating -e htop"
